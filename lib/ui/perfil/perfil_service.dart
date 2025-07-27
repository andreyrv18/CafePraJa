import 'package:firebase_auth/firebase_auth.dart';

class PerfilService {
  Future<User?> userLogged() async {
    User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      return currentUser;
    }
    return null;
  }
}
