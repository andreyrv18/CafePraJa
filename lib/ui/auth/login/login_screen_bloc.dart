import 'package:bloc/bloc.dart';
import 'package:cafe_pra_ja/ui/auth/login/login_screen_event.dart';
import 'package:cafe_pra_ja/ui/auth/login/login_screen_state.dart';

class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> {
  LoginScreenBloc() : super(LoginScreenInitialState()) {
    on<LoginScreenEvent>((event, emit) {
      emit(LoginScreenLoadingState());
      try {
        emit(LoginScreenSuccessState());
      } catch (e) {
        emit(LoginScreenErrorState('$e'));
      }
    });
  }
}
