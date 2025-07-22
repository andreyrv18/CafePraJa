import 'package:cafe_pra_ja/ui/abstract_bloc.dart';
import 'package:cafe_pra_ja/ui/abstract_state.dart';
import 'package:cafe_pra_ja/ui/core/localization/cafe_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AbstractPage extends StatefulWidget {
  const AbstractPage({super.key});

  @override
  State<AbstractPage> createState() => _State();
}

class _State extends State<AbstractPage> {
  /// bloc
  final abstractBloc = AbstractBloc();
  /// variaveis
  final abstractcController = TextEditingController();
  /// init state
  @override
  void initState() {
    super.initState();
  }
  /// Metodos
  void abstractMetod() {
    
  }
  /// Widget

  Widget _page(state) {
    return Placeholder();
  }

  Widget abstractLoading() {
    return Center(child: CircularProgressIndicator());
  }

  Widget abstractError() {
    return Center(child: Text(CafeString.erro));
  }

  /// bloc
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AbstractBloc(),
      child: BlocBuilder<AbstractBloc, AbstractState>(
        builder: (BuildContext context, AbstractState state) {
          switch (state) {
            case AbstractLoadingState():
              return abstractLoading();
            case AbstractSuccessState():
              return _page(state);
            case AbstractErrorState():
              return abstractError();
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
    abstractcController.dispose();
  }
}
