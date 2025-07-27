import 'package:firebase_auth/firebase_auth.dart';

sealed class PerfilState {}

final class PerfilInitialState extends PerfilState {}

class PerfilLoadingState extends PerfilState {}

class PerfilSuccessState extends PerfilState {
  final User user;

  PerfilSuccessState(this.user);
}

class PerfilErrorState extends PerfilState {
  final String message;

  PerfilErrorState(this.message);
}
