sealed class CadastroEvent {}

class CadastroInitialEvent extends CadastroEvent {}

class CadastroLoadingEvent extends CadastroEvent {}

class CadastroSuccessEvent extends CadastroEvent {}

class CadastroErrorEvent extends CadastroEvent {
  final String message;
  CadastroErrorEvent(this.message);
}
