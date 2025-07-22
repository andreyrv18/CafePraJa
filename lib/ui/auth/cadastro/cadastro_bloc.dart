import 'package:bloc/bloc.dart';
import 'package:cafe_pra_ja/ui/auth/cadastro/cadastro_event.dart';
import 'package:cafe_pra_ja/ui/auth/cadastro/cadastro_state.dart';

class AbstractBloc extends Bloc<CadastroEvent, CadastroState> {
  AbstractBloc() : super(CadastroInitialState()) {
    on<CadastroEvent>((event, emit) {
      emit(CadastroLoadingState());
      try {
        emit(CadastroSuccessState());
      } catch (e) {
        emit(CadastroErrorState('$e'));
      }
    });
  }
}
