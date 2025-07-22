sealed class CheckoutState {}

final class CheckoutInitialState extends CheckoutState {}

class CheckoutLoadingState extends CheckoutState {}

class CheckoutSuccessState extends CheckoutState {}

class CheckoutErrorState extends CheckoutState {
  final String message;
  CheckoutErrorState(this.message);
}
