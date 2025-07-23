import 'package:cafe_pra_ja/data/services/auth_firebase_service.dart';
import 'package:cafe_pra_ja/routing/routes.dart';
import 'package:cafe_pra_ja/ui/auth/login/login_bloc.dart';
import 'package:cafe_pra_ja/ui/auth/login/login_state.dart';
import 'package:cafe_pra_ja/ui/core/localization/cafe_string.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  String? validarEmail(value) {
    if (value == null || value.isEmpty) {
      return CafeString.emailEObrigatorio;
    } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
      return CafeString.digiteUmEmailValido;
    }
    return null;
  }

  String? validarSenha(value) {
    if (value == null || value.isEmpty) {
      return CafeString.senhaObrigatoria;
    } else if (value.length < 6) {
      return CafeString.senhaDeveTerPeloMenos6Caracteres;
    }
    return null;
  }


  void validarLogin() async{
    if (_formKey.currentState!.validate()) {

        final email = _emailController.text.trim();
        final senha = _senhaController.text.trim();
        await _credential.logInWithEmailAndPassword(email: email, password: senha);
        FirebaseAuth.instance
            .userChanges()
            .listen((User? user) {
          if (user == null) {
            print('User is currently signed in!');
          } else {
            print('User is signed out!');
          }
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(CafeString.acessoAutorizado),
          ),
        );
        context.go(Routes.perfil);

    }
  }

  /// Widget

  Widget _page(state) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(27),
        decoration: BoxDecoration(color: theme.colorScheme.surface),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: const Icon(Icons.coffee_sharp, size: 150.0)),
              const SizedBox(height: 30),
              Text(
                CafeString.digiteOsDadosDeAcessoNosCamposAbaixo,
                style: TextStyle(color: theme.colorScheme.onSurface),
              ),
              const SizedBox(height: 30),

              // Campo de e-mail
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: theme.colorScheme.surfaceContainerHighest,
                  hintText: CafeString.digiteSeuEmail,
                  hintStyle: TextStyle(
                    color: theme.colorScheme.onSurfaceVariant,
                    fontSize: 14,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (value) => validarEmail(value),
              ),
              const SizedBox(height: 10),

              // Campo de senha
              TextFormField(
                controller: _senhaController,
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: theme.colorScheme.surfaceContainerHighest,
                  hintText: CafeString.digiteSuaSenha,
                  hintStyle: TextStyle(
                    color: theme.colorScheme.onSurfaceVariant,
                    fontSize: 14,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (value) => validarSenha(value),
              ),

              // Botão Esqueceu a senha
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  // () => _recoverPassword(_emailController.text.trim()),
                  child: Text(
                    CafeString.esqueceuASenha,
                    style: TextStyle(color: theme.colorScheme.primary),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // Botão de acessar
              SizedBox(
                width: double.infinity,
                child: MaterialButton(
                  padding: const EdgeInsets.all(17),
                  color: theme.colorScheme.tertiary,
                  child: Text(
                    CafeString.acessar,
                    style: TextStyle(
                      color: theme.colorScheme.onTertiary,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () => validarLogin(),
                ),
              ),
              const SizedBox(height: 7),

              // Botão de criar conta
              Container(
                width: double.infinity,
                color: theme.colorScheme.secondary,
                child: MaterialButton(
                  child: Text(
                    CafeString.crieSuaConta,
                    style: TextStyle(
                      color: theme.colorScheme.onSecondary,
                      fontSize: 14,
                    ),
                  ),
                  onPressed: () {
                    // Navegar para tela de cadastro, se houver
                    context.push(Routes.cadastro);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// bloc
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: BlocBuilder<LoginBloc, LoginState>(
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
