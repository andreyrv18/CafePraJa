sealed class CuponsScreenEvent {}

class CuponsScreenInitialEvent extends CuponsScreenEvent {}

class CuponsScreenLoadingEvent extends CuponsScreenEvent {}

class CuponsScreenSuccessEvent extends CuponsScreenEvent {}

class CuponsScreenErrorEvent extends CuponsScreenEvent {
  final String message;
  CuponsScreenErrorEvent(this.message);
}
