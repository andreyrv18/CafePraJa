sealed class LoginScreenEvent {}

class LoginScreenInitialEvent extends LoginScreenEvent {}

class LoginScreenLoadingEvent extends LoginScreenEvent {}

class LoginScreenSuccessEvent extends LoginScreenEvent {}

class LoginScreenErrorEvent extends LoginScreenEvent {
  final String message;
  LoginScreenErrorEvent(this.message);
}
