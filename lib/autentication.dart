<<<<<<< andrey-fapi
import 'package:flutter/cupertino.dart';

class Autenticacao extends StatelessWidget {
  const Autenticacao({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
=======
import 'package:firebase_auth/firebase_auth.dart';

class AutenticacaoServico {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String?> cadastrarUsuario({
    required String email,
    required String senha,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: senha,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
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
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
>>>>>>> main
