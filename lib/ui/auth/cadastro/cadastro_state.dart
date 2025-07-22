sealed class CadastroState {}

final class CadastroInitialState extends CadastroState {}

class CadastroLoadingState extends CadastroState {}

class CadastroSuccessState extends CadastroState {}

class CadastroErrorState extends CadastroState {
  final String message;
  CadastroErrorState(this.message);
}
