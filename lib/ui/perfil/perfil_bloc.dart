import 'package:bloc/bloc.dart';
import 'package:cafe_pra_ja/ui/perfil/perfil_event.dart';
import 'package:cafe_pra_ja/ui/perfil/perfil_state.dart';

class PerfilBloc extends Bloc<PerfilEvent, PerfilState> {
  PerfilBloc() : super(PerfilInitialState()) {
    on<PerfilEvent>((event, emit) {
      emit(PerfilLoadingState());
      try {
        emit(PerfilSuccessState());
      } catch (e) {
        emit(PerfilErrorState('$e'));
      }
    });
  }
}
