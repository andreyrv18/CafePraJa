import 'package:cafe_pra_ja/data/services/auth_firebase_service.dart';

class AuthFirebaseRepository {
  late final AuthFirebaseService _authFirebaseService;
  // AuthFirebaseRepository(this._authFirebaseService);

  Future<void> signUpWithEmailAndPassword(
    // String nome,
    String email,
    String senha,
  ) {
    return _authFirebaseService.signUpWithEmailAndPassword(
      // nome: nome,
      email: email,
      senha: senha,
    );
  }

  Future<void> logInWithEmailAndPassword(String email, String senha) {
    return _authFirebaseService.logInWithEmailAndPassword(email: email, password: senha);
  }
}
