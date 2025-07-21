import 'package:cafe_pra_ja/ui/auth/cadastro/cadastro_screen_state.dart';
import 'package:cafe_pra_ja/ui/auth/login/login_screen_bloc.dart';
import 'package:cafe_pra_ja/ui/auth/login/login_screen_state.dart';
import 'package:cafe_pra_ja/ui/core/localization/cafe_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Subject extends StatefulWidget {
  const Subject({super.key});

  @override
  State<Subject> createState() => _State();
}

class _State extends State<Subject> {
  /// bloc
  final blocA = LoginScreenBloc();
  /// variaveis
  final a = TextEditingController();
  /// init state
  @override
  void initState() {
    super.initState();
  }
  /// Widget

  Widget _page(state) {
    return Placeholder();
  }

  /// bloc
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginScreenBloc(),
      child: BlocBuilder<LoginScreenBloc, LoginScreenState>(
        builder: (BuildContext context, LoginScreenState state) {
          switch (state) {
            case CadastroScreenLoadingState():
              return const Center(child: CircularProgressIndicator());
            case CadastroScreenSuccessState():
              return _page(state);
            case CadastroScreenErrorState():
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
    a.dispose();
  }
}
