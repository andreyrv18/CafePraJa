sealed class CheckoutEvent {}

class CheckoutInitialEvent extends CheckoutEvent {}

class CheckoutLoadingEvent extends CheckoutEvent {}

class CheckoutSuccessEvent extends CheckoutEvent {}

class CheckoutErrorEvent extends CheckoutEvent {
  final String message;
  CheckoutErrorEvent(this.message);
}
