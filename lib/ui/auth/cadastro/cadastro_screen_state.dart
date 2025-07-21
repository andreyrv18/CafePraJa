sealed class CadastroScreenState {}

final class CadastroScreenInitialState extends CadastroScreenState {}

class CadastroScreenLoadingState extends CadastroScreenState {}

class CadastroScreenSuccessState extends CadastroScreenState {}

class CadastroScreenErrorState extends CadastroScreenState {
  final String message;
  CadastroScreenErrorState(this.message);
}
