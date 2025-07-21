sealed class CadastroScreenEvent {}

class CadastroScreenInitialEvent extends CadastroScreenEvent {}

class CadastroScreenLoadingEvent extends CadastroScreenEvent {}

class CadastroScreenSuccessEvent extends CadastroScreenEvent {}

class CadastroScreenErrorEvent extends CadastroScreenEvent {
  final String message;
  CadastroScreenErrorEvent(this.message);
}
