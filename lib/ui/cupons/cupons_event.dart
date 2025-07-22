sealed class CuponsEvent {}

class CuponsInitialEvent extends CuponsEvent {}

class CuponsLoadingEvent extends CuponsEvent {}

class CuponsSuccessEvent extends CuponsEvent {}

class CuponsErrorEvent extends CuponsEvent {
  final String message;
  CuponsErrorEvent(this.message);
}
