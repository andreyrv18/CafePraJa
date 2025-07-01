import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cafe_pra_ja/screens/perfil.dart'; // Importar a tela de perfil

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _formKey = GlobalKey<FormState>();
  var nomeController = TextEditingController();
  var sobrenomeController = TextEditingController();
  var emailController = TextEditingController();
  var senhaController = TextEditingController();
  var segundaSenhaController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool _isLoading = false;

  Future<void> _cadastrarUsuario() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => _isLoading = true);

    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: senhaController.text,
      );

      User? user = userCredential.user;

      if (user != null) {
        // Salvar dados adicionais do usuário no Firestore
        await _firestore.collection('users').doc(user.uid).set({
          'name': nomeController.text,
          'surname': sobrenomeController.text,
          'email': emailController.text,
          // Adicione outros campos que desejar salvar
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Cadastro realizado com sucesso!')),
        );

        // Navegar para a tela de perfil, passando os dados do usuário
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Perfil(user: user), // Passa o objeto User do Firebase
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      String message;
      if (e.code == 'weak-password') {
        message = 'A senha fornecida é muito fraca.';
      } else if (e.code == 'email-already-in-use') {
        message = 'O e-mail já está em uso por outra conta.';
      } else {
        message = 'Erro ao cadastrar: ${e.message}';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro inesperado: ${e.toString()}')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    nomeController.dispose();
    sobrenomeController.dispose();
    emailController.dispose();
    senhaController.dispose();
    segundaSenhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final ColorScheme theme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text("Cadastro")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              TextFormField(
                controller: nomeController,
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: theme.outline),
                  border: OutlineInputBorder(borderSide: const BorderSide(width: 2)),
                  icon: const Icon(Icons.person_2),
                  hintText: 'Como posso chamar você?',
                  labelText: 'Nome *',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu nome';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: sobrenomeController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: const BorderSide(width: 2)),
                  hintStyle: TextStyle(color: theme.outline),
                  icon: const Icon(Icons.person_2_outlined),
                  hintText: 'Qual é o seu sobrenome?',
                  labelText: 'Sobrenome *',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu sobrenome';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: const BorderSide(width: 2)),
                  hintStyle: TextStyle(color: theme.outline),
                  icon: const Icon(Icons.email),
                  hintText: 'Ex: seumelhoremail@gmail.com *',
                  labelText: 'Digite seu email *',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu e-mail';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Por favor, insira um e-mail válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              TextFormField(
                obscureText: true,
                controller: senhaController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: const BorderSide(width: 2)),
                  hintStyle: TextStyle(color: theme.outline),
                  icon: const Icon(Icons.lock),
                  hintText: 'Digite sua senha *',
                  labelText: 'Senha *',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira sua senha';
                  } else if (value.length < 6) {
                    return 'A senha deve ter pelo menos 6 caracteres';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: segundaSenhaController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: const BorderSide(width: 2)),
                  hintStyle: TextStyle(color: theme.outline),
                  icon: const Icon(Icons.lock_outline),
                  hintText: 'Senha *',
                  labelText: 'Digite novamente sua senha *',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, confirme sua senha';
                  } else if (value != senhaController.text) {
                    return 'As senhas não coincidem';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 40),
              FloatingActionButton.extended(
                backgroundColor: theme.primary,
                elevation: 5,
                foregroundColor: theme.onPrimary,
                onPressed: _cadastrarUsuario,
                label: const Text("Cadastrar!"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

