sealed class LoginState {}

final class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginErrorState extends LoginState {
  final String message;
  LoginErrorState(this.message);
}

class LoginSubmittedState extends LoginState {
  final String email;
  final String password;
  LoginSubmittedState({required this.email, required this.password});
}

class LogoutRequestedState extends LoginState {}
