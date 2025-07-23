import 'dart:io';

import 'package:cafe_pra_ja/routing/routes.dart';
import 'package:cafe_pra_ja/ui/core/localization/cafe_string.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  // 1. A variável do utilizador agora é anulável para lidar com o estado de "não autenticado".
  User? _user;
  String _name = '';
  String? _email = '';
  String? _phone;
  String? _profileImagePath;

  File? _imageFile;

  final _editFormKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
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
    _emailController.text = _email!;
    _phoneController.text = _phone ?? '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(CafeString.editarPerfil),
          content: Form(
            key: _editFormKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: CafeString.nome,
                    ),
                    validator:
                        (value) =>
                            value == null || value.isEmpty
                                ? CafeString.nomeNaoPodeEstarEmBranco
                                : null,
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: CafeString.email,
                    ),
                    enabled:
                        false, // Não é recomendado permitir a edição do email de login aqui
                  ),
                  TextFormField(
                    controller: _phoneController,
                    decoration: const InputDecoration(
                      labelText: CafeString.telefone,
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              child: const Text(CafeString.cancelar),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              child: const Text(CafeString.salvar),
              onPressed: () async {},
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
      return Scaffold(
        appBar: AppBar(title: const Text(CafeString.perfil)),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(CafeString.voceNaoEstaAutenticado),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => context.push(Routes.login),
                child: const Text(CafeString.fazerLogin),
              ),
            ],
          ),
        ),
      );


  //  return Scaffold(
  //     appBar: AppBar(
  //       title: const Text(CafeString.perfil),
  //       backgroundColor: Theme.of(context).colorScheme.inversePrimary,
  //       actions: [
  //         IconButton(
  //           icon: const Icon(Icons.logout),
  //           onPressed: () async {
  //             await FirebaseAuth.instance.signOut();
  //             context.go(Routes.perfil);
  //             // O redirect do GoRouter irá lidar com a navegação para /login
  //           },
  //         ),
  //       ],
  //     ),
  //     body: SingleChildScrollView(
  //       padding: const EdgeInsets.all(20.0),
  //       child: Center(
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             GestureDetector(
  //               onTap: _pickImage,
  //               child: CircleAvatar(
  //                 radius: 60,
  //                 backgroundColor: Colors.grey[300],
  //                 backgroundImage:
  //                     _imageFile != null
  //                         ? FileImage(_imageFile!)
  //                         : _profileImagePath != null
  //                         ? NetworkImage(
  //                           _profileImagePath!,
  //                         ) // Assumindo que é um URL do Firebase Storage
  //                         : null,
  //                 child:
  //                     _imageFile == null && _profileImagePath == null
  //                         ? Icon(
  //                           Icons.camera_alt,
  //                           size: 50,
  //                           color: Colors.grey[700],
  //                         )
  //                         : null,
  //               ),
  //             ),
  //             const SizedBox(height: 8),
  //             TextButton(
  //               onPressed: _pickImage,
  //               child: const Text(CafeString.alterarFoto),
  //             ),
  //             const SizedBox(height: 30),
  //             _buildInfoCard(
  //               title: CafeString.informacoesPessoais,
  //               children: [
  //                 _buildInfoRow(
  //                   icon: Icons.person,
  //                   label: CafeString.nome,
  //                   value: _name,
  //                 ),
  //                 _buildInfoRow(
  //                   icon: Icons.email,
  //                   label: CafeString.email,
  //                   value: _email!,
  //                 ),
  //                 if (_phone != null && _phone!.isNotEmpty)
  //                   _buildInfoRow(
  //                     icon: Icons.phone,
  //                     label: CafeString.telefone,
  //                     value: _phone!,
  //                   ),
  //               ],
  //             ),
  //             const SizedBox(height: 30),
  //             ElevatedButton.icon(
  //               icon: const Icon(Icons.edit),
  //               label: const Text(CafeString.editarPerfil),
  //               onPressed: _showEditDialog,
  //               style: ElevatedButton.styleFrom(
  //                 padding: const EdgeInsets.symmetric(
  //                   horizontal: 30,
  //                   vertical: 15,
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  }
  //
  // Widget _buildInfoCard({
  //   required String title,
  //   required List<Widget> children,
  // }) {
  //   return Card(
  //     elevation: 4,
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  //     child: Container(
  //       padding: const EdgeInsets.all(16.0),
  //       width: double.infinity,
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text(
  //             title,
  //             style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //           ),
  //           const Divider(height: 20, thickness: 1),
  //           ...children,
  //         ],
  //       ),
  //     ),
  //   );
  // }
  //
  // Widget _buildInfoRow({
  //   required IconData icon,
  //   required String label,
  //   required String value,
  // }) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 8.0),
  //     child: Row(
  //       children: <Widget>[
  //         Icon(icon, color: Theme.of(context).primaryColor, size: 20),
  //         const SizedBox(width: 15),
  //         Text(
  //           '$label: ',
  //           style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
  //         ),
  //         Expanded(
  //           child: Text(
  //             value,
  //             style: const TextStyle(fontSize: 16),
  //             overflow: TextOverflow.ellipsis,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
