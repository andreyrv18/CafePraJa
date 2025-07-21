// import 'package:cafe_pra_ja/data/repositories/auth_firebase_repository.dart';
// import 'package:cafe_pra_ja/routing/routes.dart';
// import 'package:cafe_pra_ja/ui/core/localization/cafe_string.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//
//
//   final _formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _senhaController = TextEditingController();
//   late final AuthFirebaseRepository _authRepository;
//
//
//   bool _isLoading = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _authRepository = AuthFirebaseRepository();
//   }
//
//   Future<void> logInWithEmailAndPassword() async {
//     if (_formKey.currentState!.validate()) {
//       final email = _emailController.text.trim();
//       final senha = _senhaController.text.trim();
//       await _authRepository.logInWithEmailAndPassword(email, senha);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (_isLoading) {
//       return const Scaffold(body: Center(child: CircularProgressIndicator()));
//     }
//
//     final ThemeData theme = Theme.of(context);
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         padding: const EdgeInsets.all(27),
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [theme.colorScheme.primary, theme.colorScheme.onSurface],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const SizedBox(height: 100),
//               const Icon(Icons.coffee_sharp, size: 150.0),
//               const SizedBox(height: 30),
//               Text(
//                 CafeString.digiteOsDadosDeAcessoNosCamposAbaixo,
//                 style: TextStyle(color: theme.colorScheme.onPrimary),
//               ),
//               const SizedBox(height: 30),
//
//               // Campo de e-mail
//               TextFormField(
//                 controller: _emailController,
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: const Color(0x332D1B0B),
//                   hintText: CafeString.digiteSeuEmail,
//                   hintStyle: TextStyle(
//                     color: theme.colorScheme.onPrimary,
//                     fontSize: 14,
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(7),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//                 style: const TextStyle(color: Colors.white),
//                 validator: (String? value) {
//                   if (value == null || value.isEmpty) {
//                     return CafeString.emailEObrigatorio;
//                   } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
//                     return CafeString.digiteUmEmailValido;
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 10),
//
//               // Campo de senha
//               TextFormField(
//                 controller: _senhaController,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: const Color(0x332D1B0B),
//                   hintText: CafeString.digiteSuaSenha,
//                   hintStyle: TextStyle(
//                     color: theme.colorScheme.onPrimary,
//                     fontSize: 14,
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(7),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//                 style: const TextStyle(color: Colors.white),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return CafeString.senhaObrigatoria;
//                   } else if (value.length < 6) {
//                     return CafeString.senhaDeveTerPeloMenos6Caracteres;
//                   }
//                   return null;
//                 },
//               ),
//
//               // Botão Esqueceu a senha
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: TextButton(
//                   onPressed: () {},
//                   // () => _recoverPassword(_emailController.text.trim()),
//                   child: const Text(
//                     CafeString.esqueceuASenha,
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//
//               const SizedBox(height: 10),
//
//               // Botão de acessar
//               SizedBox(
//                 width: double.infinity,
//                 child: MaterialButton(
//                   padding: const EdgeInsets.all(17),
//                   color: theme.colorScheme.primary,
//                   child: Text(
//                     CafeString.acessar,
//                     style: TextStyle(
//                       color: theme.colorScheme.onPrimary,
//                       fontSize: 14,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   onPressed: ()  {
//                     if (_formKey.currentState!.validate()) {
//                       setState(() => _isLoading = true);
//                       try {
//                         logInWithEmailAndPassword();
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(content: Text(CafeString.acessoAutorizado)),
//                         );
//                         context.go(Routes.perfil);
//                       } on FirebaseAuthException catch (e) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(content: Text('${CafeString.erro}: ${e.message}')),
//                         );
//                       } catch (e) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text('${CafeString.erroInesperado}: ${e.toString()}'),
//                           ),
//                         );
//                       } finally {
//                         setState(() => _isLoading = false);
//                       }
//                     }
//                   },
//                 ),
//               ),
//               const SizedBox(height: 7),
//
//               // Botão de criar conta
//               Container(
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: theme.colorScheme.onPrimary,
//                     width: 0.8,
//                   ),
//                   borderRadius: BorderRadius.circular(7),
//                 ),
//                 child: MaterialButton(
//                   child: Text(
//                     CafeString.crieSuaConta,
//                     style: TextStyle(
//                       color: theme.colorScheme.onPrimary,
//                       fontSize: 14,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   onPressed: () {
//                     // Navegar para tela de cadastro, se houver
//                     context.go(Routes.cadastro);
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _emailController.dispose();
//     _senhaController.dispose();
//     super.dispose();
//   }
// }
