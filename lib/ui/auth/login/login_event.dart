sealed class LoginEvent {}

class LoginInitialEvent extends LoginEvent {}

class LoginLoadingEvent extends LoginEvent {}

class LoginSuccessEvent extends LoginEvent {}

class LoginErrorEvent extends LoginEvent {
  final String message;
  LoginErrorEvent(this.message);
}

class LoginSubmittedEvent extends LoginEvent {
  final String email;
  final String password;
  LoginSubmittedEvent({required this.email, required this.password});
}

class LogoutRequestedEvent extends LoginEvent {}
