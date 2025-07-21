sealed class CheckoutScreenEvent {}

class CheckoutScreenInitialEvent extends CheckoutScreenEvent {}

class CheckoutScreenLoadingEvent extends CheckoutScreenEvent {}

class CheckoutScreenSuccessEvent extends CheckoutScreenEvent {}

class CheckoutScreenErrorEvent extends CheckoutScreenEvent {
  final String message;
  CheckoutScreenErrorEvent(this.message);
}
