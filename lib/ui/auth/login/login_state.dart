sealed class LoginState {
  const LoginState();
}

final class LoginInitialState extends LoginState {
  const LoginInitialState({this.email = '', this.password = ''});

  final String email;
  final String password;
}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  const LoginSuccessState({required this.email, required this.password});

  final String email;
  final String password;
}

class LoginErrorState extends LoginState {
  const LoginErrorState({required this.message});

  final String message;

  List<Object> get props => [message];
}

class LoginLogoutRequestedState extends LoginState {}
