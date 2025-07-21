import 'package:bloc/bloc.dart';
import 'package:cafe_pra_ja/ui/perfil/perfil_screen_event.dart';
import 'package:cafe_pra_ja/ui/perfil/perfil_screen_state.dart';

class PerfilScreenBloc extends Bloc<PerfilScreenEvent, PerfilScreenState> {
  PerfilScreenBloc() : super(PerfilScreenInitialState()) {
    on<PerfilScreenEvent>((event, emit) {
      emit(PerfilScreenLoadingState());
      try {
        emit(PerfilScreenSuccessState());
      } catch (e) {
        emit(PerfilScreenErrorState('$e'));
      }
    });
  }
}
