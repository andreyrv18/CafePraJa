sealed class LoginScreenState {}

final class LoginScreenInitialState extends LoginScreenState {}

class LoginScreenLoadingState extends LoginScreenState {}

class LoginScreenSuccessState extends LoginScreenState {}

class LoginScreenErrorState extends LoginScreenState {
  final String message;
  LoginScreenErrorState(this.message);
}
