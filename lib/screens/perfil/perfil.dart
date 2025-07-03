import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  // 1. A variável do utilizador agora é anulável para lidar com o estado de "não autenticado".
  User? _user;
  String _name = "";
  String _email = "";
  String? _phone;
  String? _profileImagePath;

  File? _imageFile;

  bool _isLoading = true;

  final _editFormKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // 2. Inicializa a variável _user com o utilizador atual do Firebase.
    _user = FirebaseAuth.instance.currentUser;

    // 3. Verifica se um utilizador realmente existe.
    if (_user != null) {
      // Se existe, pode obter o email e começar a carregar os dados do Firestore.
      _email = _user!.email ?? "";
      _fetchUserData();
    } else {
      // Se não há utilizador, para o carregamento. O método build irá lidar com isto.
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _fetchUserData() async {
    // Uma verificação extra para garantir que não prosseguimos sem um utilizador.
    if (_user == null) return;

    try {
      // Agora é seguro usar _user!.uid
      DocumentSnapshot userDoc =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(_user!.uid)
              .get();

      if (mounted && userDoc.exists) {
        final data = userDoc.data() as Map<String, dynamic>;
        setState(() {
          _name = data['name'] ?? "";
          _email =
              data['email'] ??
              _user!.email ??
              ""; // Fallback para o email do Auth
          _phone = data['phone'];
          _profileImagePath = data['profileImagePath'];
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Erro ao carregar dados do utilizador: ${e.toString()}',
            ),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
        _profileImagePath = pickedFile.path;
        // Aqui você adicionaria a lógica para fazer o upload da imagem para o Firebase Storage
        // e salvar o URL no Firestore.
      });
    }
  }

  void _showEditDialog() {
    _nameController.text = _name;
    _emailController.text = _email;
    _phoneController.text = _phone ?? "";

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Editar Perfil"),
          content: Form(
            key: _editFormKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: "Nome"),
                    validator:
                        (value) =>
                            value == null || value.isEmpty
                                ? 'Nome não pode ficar em branco'
                                : null,
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: "Email"),
                    enabled:
                        false, // Não é recomendado permitir a edição do email de login aqui
                  ),
                  TextFormField(
                    controller: _phoneController,
                    decoration: const InputDecoration(labelText: "Telefone"),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              child: const Text("Cancelar"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              child: const Text("Salvar"),
              onPressed: () async {
                if (_editFormKey.currentState!.validate()) {
                  try {
                    await FirebaseFirestore.instance
                        .collection('users')
                        .doc(_user!.uid) // Seguro usar _user!
                        .update({
                          'name': _nameController.text,
                          'phone':
                              _phoneController.text.isNotEmpty
                                  ? _phoneController.text
                                  : null,
                        });
                    setState(() {
                      _name = _nameController.text;
                      _phone =
                          _phoneController.text.isNotEmpty
                              ? _phoneController.text
                              : null;
                    });
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Perfil atualizado com sucesso"),
                      ),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Erro ao atualizar perfil: ${e.toString()}',
                        ),
                      ),
                    );
                  }
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 4. Se não há utilizador, mostra uma tela de "não autenticado".
    if (_user == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Perfil')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Você não está autenticado.'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => context.go('/login'),
                child: const Text('Fazer Login'),
              ),
            ],
          ),
        ),
      );
    }

    // O resto do build só é executado se houver um utilizador.
    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              // O redirect do GoRouter irá lidar com a navegação para /login
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.grey[300],
                  backgroundImage:
                      _imageFile != null
                          ? FileImage(_imageFile!)
                          : _profileImagePath != null
                          ? NetworkImage(
                            _profileImagePath!,
                          ) // Assumindo que é um URL do Firebase Storage
                          : null,
                  child:
                      _imageFile == null && _profileImagePath == null
                          ? Icon(
                            Icons.camera_alt,
                            size: 50,
                            color: Colors.grey[700],
                          )
                          : null,
                ),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: _pickImage,
                child: const Text("Alterar Foto"),
              ),
              const SizedBox(height: 30),
              _buildInfoCard(
                title: "Informações Pessoais",
                children: [
                  _buildInfoRow(
                    icon: Icons.person,
                    label: "Nome",
                    value: _name,
                  ),
                  _buildInfoRow(
                    icon: Icons.email,
                    label: "Email",
                    value: _email,
                  ),
                  if (_phone != null && _phone!.isNotEmpty)
                    _buildInfoRow(
                      icon: Icons.phone,
                      label: "Telefone",
                      value: _phone!,
                    ),
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                icon: const Icon(Icons.edit),
                label: const Text("Editar Perfil"),
                onPressed: _showEditDialog,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required String title,
    required List<Widget> children,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(height: 20, thickness: 1),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: <Widget>[
          Icon(icon, color: Theme.of(context).primaryColor, size: 20),
          const SizedBox(width: 15),
          Text(
            "$label: ",
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
