import 'package:bloc/bloc.dart';
import 'package:cafe_pra_ja/data/services/auth_firebase_service.dart';
import 'package:cafe_pra_ja/ui/auth/login/login_event.dart';
import 'package:cafe_pra_ja/ui/auth/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LoginSubmittedEvent>((event, emit) async {
      emit(LoginLoadingState());
      try {
        final authenticationService = AuthFirebaseService();

        await authenticationService.logInWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );

        emit(LoginSuccessState());
      } catch (e) {
        emit(LoginErrorState('$e'));
      }
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
