import 'package:cafe_pra_ja/data/services/auth_firebase_service.dart';
import 'package:cafe_pra_ja/routing/routes.dart';
import 'package:cafe_pra_ja/ui/auth/login/login_bloc.dart';
import 'package:cafe_pra_ja/ui/auth/login/login_state.dart';
import 'package:cafe_pra_ja/ui/core/localization/cafe_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _State();
}

class _State extends State<LoginPage> {
  /// bloc
  final loginBloc = LoginBloc();

  /// variaveis
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  final _credential = AuthFirebaseService();

  /// init state
  @override
  void initState() {
    super.initState();
  }

  /// Metodos

  void onChange(LoginState state) {
    if (state is LoginSubmittedState) {
      print("object");
    }
  }

  /// Widget
  Widget _EmailInput() {
    return TextField(
      key: const Key('loginForm_emailInput_textField'),
      onChanged: (value) {

      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'email',
        helperText: '',
        errorText:'invalid email',
      ),
    );
  }

  Widget _PasswordInput() {
    return TextField(
      key: const Key('loginForm_passwordInput_textField'),
      onChanged: (value) {

      },
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'password',
        helperText: '',
        errorText: 'invalid password',
      ),
    );
  }

  Widget _LoginButton(state) {
    if (state is LoginLoadingState) return const CircularProgressIndicator();

    return ElevatedButton(
      key: const Key('loginForm_continue_raisedButton'),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        backgroundColor: const Color(0xFFFFD600),
      ),
      onPressed: () {},

      child: const Text('LOGIN'),
    );
  }

  Widget _GoogleLoginButton() {
    final theme = Theme.of(context);
    return ElevatedButton.icon(
      key: const Key('loginForm_googleLogin_raisedButton'),
      label: const Text(
        'SIGN IN WITH GOOGLE',
        style: TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: theme.colorScheme.secondary,
      ),
      icon: const Icon(Icons.add, color: Colors.white),
      onPressed: () {

      },
    );
  }
  Widget _SignUpButton() {
    final theme = Theme.of(context);
    return TextButton(
      key: const Key('loginForm_createAccount_flatButton'),
      onPressed: () => context.push(Routes.cadastro),
      child: Text(
        'CREATE ACCOUNT',
        style: TextStyle(color: theme.primaryColor),
      ),
    );
  }

  Widget _page(LoginState state) {
    if (state is LoginErrorState) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text('Authentication Failure')));
    }
    return Scaffold(
      body: Align(
        alignment: const Alignment(0, -1 / 3),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/bloc_logo_small.png', height: 120),
              const SizedBox(height: 16),
              _EmailInput(),
              const SizedBox(height: 8),
              _PasswordInput(),
              const SizedBox(height: 8),
              _LoginButton(state),
              const SizedBox(height: 8),
              _GoogleLoginButton(),
              const SizedBox(height: 4),
              _SignUpButton(),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _page2(state) {
  //   final ThemeData theme = Theme.of(context);
  //
  //   return Scaffold(
  //     extendBodyBehindAppBar: true,
  //     appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
  //     body: Container(
  //       width: MediaQuery.of(context).size.width,
  //       padding: const EdgeInsets.all(27),
  //       decoration: BoxDecoration(color: theme.colorScheme.surface),
  //       child: Form(
  //         key: _formKey,
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Center(child: const Icon(Icons.coffee_sharp, size: 150.0)),
  //             const SizedBox(height: 30),
  //             Text(
  //               CafeString.digiteOsDadosDeAcessoNosCamposAbaixo,
  //               style: TextStyle(color: theme.colorScheme.onSurface),
  //             ),
  //             const SizedBox(height: 30),
  //
  //             // Campo de e-mail
  //             TextFormField(
  //               controller: _emailController,
  //               decoration: InputDecoration(
  //                 filled: true,
  //                 fillColor: theme.colorScheme.surfaceContainerHighest,
  //                 hintText: CafeString.digiteSeuEmail,
  //                 hintStyle: TextStyle(
  //                   color: theme.colorScheme.onSurfaceVariant,
  //                   fontSize: 14,
  //                 ),
  //                 border: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(7),
  //                   borderSide: BorderSide.none,
  //                 ),
  //               ),
  //               validator: (value) => validarEmail(value),
  //             ),
  //             const SizedBox(height: 10),
  //
  //             // Campo de senha
  //             TextFormField(
  //               controller: _senhaController,
  //               obscureText: true,
  //               decoration: InputDecoration(
  //                 filled: true,
  //                 fillColor: theme.colorScheme.surfaceContainerHighest,
  //                 hintText: CafeString.digiteSuaSenha,
  //                 hintStyle: TextStyle(
  //                   color: theme.colorScheme.onSurfaceVariant,
  //                   fontSize: 14,
  //                 ),
  //                 border: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(7),
  //                   borderSide: BorderSide.none,
  //                 ),
  //               ),
  //               validator: (value) => validarSenha(value),
  //             ),
  //
  //             // Botão Esqueceu a senha
  //             Align(
  //               alignment: Alignment.centerRight,
  //               child: TextButton(
  //                 onPressed: () {},
  //                 // () => _recoverPassword(_emailController.text.trim()),
  //                 child: Text(
  //                   CafeString.esqueceuASenha,
  //                   style: TextStyle(color: theme.colorScheme.primary),
  //                 ),
  //               ),
  //             ),
  //
  //             const SizedBox(height: 10),
  //
  //             // Botão de acessar
  //             SizedBox(
  //               width: double.infinity,
  //               child: MaterialButton(
  //                 padding: const EdgeInsets.all(17),
  //                 color: theme.colorScheme.tertiary,
  //                 child: Text(
  //                   CafeString.acessar,
  //                   style: TextStyle(
  //                     color: theme.colorScheme.onTertiary,
  //                     fontSize: 14,
  //                     fontWeight: FontWeight.w600,
  //                   ),
  //                 ),
  //                 onPressed: () => validarLogin(),
  //               ),
  //             ),
  //             const SizedBox(height: 7),
  //
  //             // Botão de criar conta
  //             Container(
  //               width: double.infinity,
  //               color: theme.colorScheme.secondary,
  //               child: MaterialButton(
  //                 child: Text(
  //                   CafeString.crieSuaConta,
  //                   style: TextStyle(
  //                     color: theme.colorScheme.onSecondary,
  //                     fontSize: 14,
  //                   ),
  //                 ),
  //                 onPressed: () {
  //                   // Navegar para tela de cadastro, se houver
  //                   context.push(Routes.cadastro);
  //                 },
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  /// bloc
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (_) => LoginBloc(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) => onChange(state),
        builder: (BuildContext context, LoginState state) {
          switch (state) {
            case LoginLoadingState():
              return const Center(child: CircularProgressIndicator());
            case LoginSuccessState():
              return _page(state);
            case LoginErrorState():
              return const Center(child: Text(CafeString.erro));
            default:
              return _page(state);
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _senhaController.dispose();
  }
}
