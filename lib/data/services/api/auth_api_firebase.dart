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
        return 'O e-mail já está em uso.';
      } else {
        return 'Erro ao cadastrar: ${e.message}';
      }
    } catch (e) {
      return 'Erro inesperado: ${e.toString()}';
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
      return e.message ?? 'Erro ao fazer login.';
    } catch (e) {
      return 'Erro inesperado: ${e.toString()}';
    }
  }
}
