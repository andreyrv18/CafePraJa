import 'package:cafe_pra_ja/routing/routes.dart';
import 'package:cafe_pra_ja/ui/auth/login/login_bloc.dart';
import 'package:cafe_pra_ja/ui/auth/login/login_event.dart';
import 'package:cafe_pra_ja/ui/auth/login/login_state.dart';
import 'package:cafe_pra_ja/ui/core/localization/cafe_string.dart';
import 'package:cafe_pra_ja/ui/perfil/perfil_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  /// bloc
  final loginBloc = LoginBloc();

  /// variaveis
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _loginButonFocusNode = FocusNode();

  /// init state
  @override
  void initState() {
    super.initState();
    loginBloc.add(LoginInitialEvent());
  }

  /// Metodos

  void onChange(LoginState state) {
    if (state is LoginSuccessState) {
      if (kDebugMode) {
        print('LoginSuccessState');
      }
    }

    if (state is LoginSuccessState) {
      context.go(Routes.perfil);
    }
  }

  void _tryLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      loginBloc.add(
        LoginSuccessEvent(
          email: _emailController.text,
          password: _passwordController.text,
        ),
      );
    }
  }

  void _handleKeyEvent(KeyEvent event) {
    if (event is KeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.enter) {
        _tryLogin();
      }
    }
  }

  /// Widget
  Widget _inputEmail() {
    final ThemeData theme = Theme.of(context);

    return TextFormField(
      autofocus: true,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      controller: _emailController,
      focusNode: _emailFocusNode,
      onFieldSubmitted: (_) {
        FocusScope.of(context).requestFocus(_passwordFocusNode);
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: theme.colorScheme.surfaceContainerHighest,
        hintText: CafeString.digiteSeuEmail,
        prefixIcon: Icon(
          Icons.email_outlined,
          color: theme.colorScheme.onSurfaceVariant,
        ),
        hintStyle: TextStyle(
          color: theme.colorScheme.onSurfaceVariant,
          fontSize: 14,
        ),
        labelText: CafeString.email,
        labelStyle: TextStyle(color: theme.colorScheme.onSurfaceVariant),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: BorderSide(color: theme.colorScheme.primary, width: 1),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return CafeString.digiteSeuEmail;
        }
        final emailRegex = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
        );
        if (!emailRegex.hasMatch(value)) {
          return CafeString.emailInvalido;
        }

        return null;
      },
    );
  }

  Widget _inputPassWord(LoginState state) {
    final ThemeData theme = Theme.of(context);

    return TextFormField(
      keyboardType: TextInputType.visiblePassword,

      controller: _passwordController,
      focusNode: _passwordFocusNode,
      obscureText: true,
      textInputAction: TextInputAction.done,
      onFieldSubmitted: (_) {
        _tryLogin();
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: theme.colorScheme.surfaceContainerHighest,
        hintText: CafeString.digiteSuaSenha,
        prefixIcon: Icon(
          Icons.lock_outline,
          color: theme.colorScheme.onSurfaceVariant,
        ),
        hintStyle: TextStyle(
          color: theme.colorScheme.onSurfaceVariant,
          fontSize: 14,
        ),
        labelText: CafeString.senha,
        labelStyle: TextStyle(color: theme.colorScheme.onSurfaceVariant),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: BorderSide(color: theme.colorScheme.primary, width: 1),
        ),
      ),
      validator: (value) {
        if (state is LoginErrorState) {
          return state.message;
        }

        if (value == null || value.isEmpty || value.length < 6) {
          return CafeString.digiteSuaSenha;
        }
        return null;
      },
    );
  }

  Widget _buttonLogin(LoginState state) {
    final ThemeData theme = Theme.of(context);
    if (state is LoginLoadingState) {
      return const CircularProgressIndicator();
    }

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        focusNode: _loginButonFocusNode,
        onPressed: _tryLogin,
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.colorScheme.tertiary,
          padding: const EdgeInsets.all(18),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(
          CafeString.acessar,
          style: TextStyle(
            color: theme.colorScheme.onTertiary,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buttonSignUp() {
    final theme = Theme.of(context);
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: () => context.push(Routes.cadastro),
        child: Text(
          CafeString.crieSuaConta,
          style: TextStyle(color: theme.colorScheme.secondary, fontSize: 14),
        ),
      ),
    );
  }

  Widget _icons() {
    final ThemeData theme = Theme.of(context);

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.coffee_maker_sharp,
              color: theme.colorScheme.primary,
              size: 180.0,
            ),
            Icon(
              Icons.coffee_sharp,
              color: theme.colorScheme.secondary,
              size: 140.0,
            ),
          ],
        ),
        Text(
          CafeString.bemVindo,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 56,
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buttonEsqueceuSenha() {
    final ThemeData theme = Theme.of(context);

    return TextButton(
      onPressed: () async {
        _emailController.text.isNotEmpty
            ? await FirebaseAuth.instance.sendPasswordResetEmail(
              email: _emailController.text,
            )
            : '';
      },
      child: Text(
        CafeString.esqueceuASenha,
        style: TextStyle(color: theme.colorScheme.primary),
      ),
    );
  }

  Widget _form(LoginState state) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _icons(),
          const SizedBox(height: 30),
          _inputEmail(),
          const SizedBox(height: 16),
          _inputPassWord(state),
          Align(
            alignment: Alignment.centerRight,
            child: _buttonEsqueceuSenha(),
          ),
          const SizedBox(height: 24),
          _buttonLogin(state),
          const SizedBox(height: 16),
          _buttonSignUp(),
        ],
      ),
    );
  }

  Widget _page(BuildContext context, LoginState state) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.go(Routes.initial),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: KeyboardListener(
        focusNode: FocusNode(),
        autofocus: true,
        onKeyEvent: _handleKeyEvent,
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(56),
          decoration: BoxDecoration(color: theme.colorScheme.surface),
          child: _form(state),
        ),
      ),
    );
  }

  /// bloc
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => loginBloc,
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) => onChange(state),
        builder: (BuildContext context, LoginState state) {
          switch (state) {
            case LoginInitialState():
              return _page(context, state);
            case LoginLoadingState():
              return _page(context, state);
            case LoginSuccessState():
              return _page(context, state);
            case LoginErrorState():
              return _page(context, state);

            case LoginLogoutRequestedState():
              return PerfilPage();
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _loginButonFocusNode.dispose();
  }
}

//
// Widget _googleLoginButton() {
//   final theme = Theme.of(context);
//   return ElevatedButton.icon(
//     key: const Key('loginForm_googleLogin_raisedButton'),
//     label: const Text(
//       'SIGN IN WITH GOOGLE',
//       style: TextStyle(color: Colors.white),
//     ),
//     style: ElevatedButton.styleFrom(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//       backgroundColor: theme.colorScheme.secondary,
//     ),
//     icon: const Icon(Icons.add, color: Colors.white),
//     onPressed: () {},
//   );
// }
