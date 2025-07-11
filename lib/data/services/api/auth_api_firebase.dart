import 'package:cafe_pra_ja/ui/core/localization/cafe_string.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthApiFirebase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String?> cadastrarUsuario({
    required String nome,
    required String email,
    required String senha,
  }) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: senha);
      await userCredential.user!.updateDisplayName(nome);
      return null; // Sucesso
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return CafeString.emailJaEstaEmUso;
      } else {
        return '${CafeString.erroAoCadastrar}: ${e.message}';
      }
    } catch (e) {
      return '${CafeString.erroInesperado}: ${e.toString()}';
    }
  }

  Future<String?> logarUsuario({
    required String email,
    required String senha,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: senha,
      );
      return null; // Sucesso
    } on FirebaseAuthException catch (e) {
      return e.message ?? CafeString.erroAoFazerLogin;
    } catch (e) {
      return '${CafeString.erroInesperado}: ${e.toString()}';
    }
  }
}
