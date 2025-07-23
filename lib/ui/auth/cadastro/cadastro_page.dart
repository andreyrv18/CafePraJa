import 'package:cafe_pra_ja/routing/routes.dart';
import 'package:cafe_pra_ja/ui/core/localization/cafe_string.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
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
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(
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

        context.go(Routes.perfil);
        // Navegar para a tela de perfil, passando os dados do usuário
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(
        //     builder:
        //         (context) => PerfilScreen(), // Passa o objeto User do Firebase
        //   ),
        // );
      }
    } on FirebaseAuthException catch (e) {
      debugPrint('$e');
      // String message;
      // if (e.code == CafeString.weakPassword) {
      //   message = CafeString.senhaFornecidaEMuitoFraca;
      // } else if (e.code == CafeString.emailAlrearyInUse) {
      //   message = CafeString.emailJaEstaEmUsoPorOutraConta;
      // } else {
      //   message = '${CafeString.erroAoCadastrar}: ${e.message}';
      // }
      // // ScaffoldMessenger.of(
      // //   context,
      // // ).showSnackBar(SnackBar(content: Text(message)));
    } catch (e) {
      debugPrint('$e');
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('${CafeString.erroInesperado}: ${e.toString()}')),
      // );
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
      appBar: AppBar(title: const Text(CafeString.cadastro)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Form(
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
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(width: 2),
                      ),
                      icon: const Icon(Icons.person_2),
                      hintText: CafeString.comoPossoChamarVoce,
                      labelText: CafeString.nome,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return CafeString.insiraSeuNome;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: sobrenomeController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(width: 2),
                      ),
                      hintStyle: TextStyle(color: theme.outline),
                      icon: const Icon(Icons.person_2_outlined),
                      hintText: CafeString.qualEOSeuSobrenome,
                      labelText: CafeString.sobrenome,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return CafeString.insiraSeuSobrenome;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(width: 2),
                      ),
                      hintStyle: TextStyle(color: theme.outline),
                      icon: const Icon(Icons.email),
                      hintText: CafeString.exemploEmail,
                      labelText: CafeString.digiteSeuEmail,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return CafeString.insiraSeuEmail;
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return CafeString.insiraUmEmailValido;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    obscureText: true,
                    controller: senhaController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(width: 2),
                      ),
                      hintStyle: TextStyle(color: theme.outline),
                      icon: const Icon(Icons.lock),
                      hintText: CafeString.digiteSuaSenha,
                      labelText: CafeString.senha,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return CafeString.insiraSuaSenha;
                      } else if (value.length < 3) {
                        return CafeString.senhaDeveTerPeloMenos6Caracteres;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: segundaSenhaController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(width: 2),
                      ),
                      hintStyle: TextStyle(color: theme.outline),
                      icon: const Icon(Icons.lock_outline),
                      hintText: CafeString.senha,
                      labelText: CafeString.digiteNovamenteSuaSenha,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return CafeString.confirmeSuaSenha;
                      } else if (value != senhaController.text) {
                        return CafeString.senhasNaoCoincidem;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 40),
                  FloatingActionButton.extended(
                    heroTag: CafeString.fabCadastro,
                    backgroundColor: theme.primary,
                    elevation: 5,
                    foregroundColor: theme.onPrimary,
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text(CafeString.cadastroRealizadoComSucesso)),
                      );
                      _cadastrarUsuario();
                    },
                    label: const Text(CafeString.cadastrar),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
