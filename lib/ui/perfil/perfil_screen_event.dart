sealed class PerfilScreenEvent {}

class PerfilScreenInitialEvent extends PerfilScreenEvent {}

class PerfilScreenLoadingEvent extends PerfilScreenEvent {}

class PerfilScreenSuccessEvent extends PerfilScreenEvent {}

class PerfilScreenErrorEvent extends PerfilScreenEvent {
  final String message;
  PerfilScreenErrorEvent(this.message);
}
