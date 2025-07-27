import 'package:bloc/bloc.dart';
import 'package:cafe_pra_ja/data/services/auth_firebase_service.dart';
import 'package:cafe_pra_ja/ui/auth/login/login_event.dart';
import 'package:cafe_pra_ja/ui/auth/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LoginInitialEvent>((event, emit) {
      emit(LoginInitialState());
    });

    on<LoginSuccessEvent>((event, emit) async {
      emit(LoginLoadingState());
      try {
        final authenticationService = AuthFirebaseService();
        await authenticationService.logInWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );

        emit(LoginSuccessState(email: event.email, password: event.password));
      } on LogInWithEmailAndPasswordFailure catch (e) {
        emit(LoginErrorState(message: e.message));
      } catch (e) {
        emit(LoginErrorState(message: '$e'));
      }
    });

    on<LoginLoadingEvent>((event, emit) {
      emit(LoginLoadingState());
    });

    on<LoginLogoutRequestedEvent>((event, emit) {
      emit(LoginLogoutRequestedState());
    });
  }
}

// bool _loggedIn = false;
//
// bool get loggedIn => _loggedIn;
//
// Future<void> init() async {
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//
//   FirebaseUIAuth.configureProviders([EmailAuthProvider()]);
//
//   FirebaseAuth.instance.userChanges().listen((user) {
//     if (user != null) {
//       _loggedIn = true;
//     } else {
//       _loggedIn = false;
//     }
//     notifyListeners();
//   });
// }
