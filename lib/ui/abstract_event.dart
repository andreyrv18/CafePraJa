
sealed class AbstractEvent {}
class AbstractInitialEvent extends AbstractEvent {}

class AbstractLoadingEvent extends AbstractEvent {}

class AbstractSuccessEvent extends AbstractEvent {}

class AbstractErrorEvent extends AbstractEvent {
  final String message;
  AbstractErrorEvent(this.message);
}