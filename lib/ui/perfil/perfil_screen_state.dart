sealed class PerfilScreenState {}

final class PerfilScreenInitialState extends PerfilScreenState {}

class PerfilScreenLoadingState extends PerfilScreenState {}

class PerfilScreenSuccessState extends PerfilScreenState {}

class PerfilScreenErrorState extends PerfilScreenState {
  final String message;
  PerfilScreenErrorState(this.message);
}
