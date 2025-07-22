sealed class PerfilState {}

final class PerfilInitialState extends PerfilState {}

class PerfilLoadingState extends PerfilState {}

class PerfilSuccessState extends PerfilState {}

class PerfilErrorState extends PerfilState {
  final String message;
  PerfilErrorState(this.message);
}
