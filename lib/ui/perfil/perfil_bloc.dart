import 'package:bloc/bloc.dart';
import 'package:cafe_pra_ja/data/services/auth_service.dart';
import 'package:cafe_pra_ja/ui/core/localization/cafe_string.dart';
import 'package:cafe_pra_ja/ui/perfil/perfil_event.dart';
import 'package:cafe_pra_ja/ui/perfil/perfil_state.dart';

class PerfilBloc extends Bloc<PerfilEvent, PerfilState> {
  PerfilBloc() : super(PerfilInitialState()) {
    on<LoadProfileEvent>((event, emit) {
      emit(PerfilLoadingState());
      try {
        final user = AuthService.currentUser;

        if (user != null) {
          emit(PerfilSuccessState(user));
        } else {
          emit(PerfilErrorState(CafeString.usuarioNaoAutenticado));
        }
      } catch (e) {
        emit(PerfilErrorState('$e'));
      }
    });
  }
}
