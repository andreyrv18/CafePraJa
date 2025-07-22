sealed class PerfilEvent {}

class PerfilInitialEvent extends PerfilEvent {}

class PerfilLoadingEvent extends PerfilEvent {}

class PerfilSuccessEvent extends PerfilEvent {}

class PerfilErrorEvent extends PerfilEvent {
  final String message;
  PerfilErrorEvent(this.message);
}
