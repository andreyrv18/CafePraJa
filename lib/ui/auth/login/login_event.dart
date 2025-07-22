sealed class LoginEvent {}

class LoginInitialEvent extends LoginEvent {}

class LoginLoadingEvent extends LoginEvent {}

class LoginSuccessEvent extends LoginEvent {}

class LoginErrorEvent extends LoginEvent {
  final String message;
  LoginErrorEvent(this.message);
}
