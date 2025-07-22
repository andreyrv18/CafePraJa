import 'package:bloc/bloc.dart';
import 'package:cafe_pra_ja/ui/auth/login/login_event.dart';
import 'package:cafe_pra_ja/ui/auth/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LoginEvent>((event, emit) {
      emit(LoginLoadingState());
      try {
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