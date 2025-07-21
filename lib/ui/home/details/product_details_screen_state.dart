sealed class CheckoutScreenState {}

final class CheckoutScreenInitialState extends CheckoutScreenState {}

class CheckoutScreenLoadingState extends CheckoutScreenState {}

class CheckoutScreenSuccessState extends CheckoutScreenState {}

class CheckoutScreenErrorState extends CheckoutScreenState {
  final String message;
  CheckoutScreenErrorState(this.message);
}
