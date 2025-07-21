import 'package:bloc/bloc.dart';
import 'package:cafe_pra_ja/ui/auth/cadastro/cadastro_screen_event.dart';
import 'package:cafe_pra_ja/ui/auth/cadastro/cadastro_screen_state.dart';

class CadastroScreenBloc extends Bloc<CadastroScreenEvent, CadastroScreenState> {
  CadastroScreenBloc() : super(CadastroScreenInitialState()) {
    on<CadastroScreenEvent>((event, emit) {
      emit(CadastroScreenLoadingState());
      try {
        emit(CadastroScreenSuccessState());
      } catch (e) {
        emit(CadastroScreenErrorState('$e'));
      }
    });
  }
}
