sealed class LoginEvent {}

class LoginInitialEvent extends LoginEvent {}

class LoginLoadingEvent extends LoginEvent {}

class LoginSuccessEvent extends LoginEvent {
  LoginSuccessEvent({required this.email, required this.password});

  final String email;
  final String password;
}

class LoginErrorEvent extends LoginEvent {
  LoginErrorEvent(this.message);

  final String message;
}

class LoginLogoutRequestedEvent extends LoginEvent {}
