sealed class ProductDetailEvent {}

class ProductDetailInitialEvent extends ProductDetailEvent {}

class ProductDetailLoadingEvent extends ProductDetailEvent {}

class ProductDetailSuccessEvent extends ProductDetailEvent {}

class ProductDetailErrorEvent extends ProductDetailEvent {
  final String message;
  ProductDetailErrorEvent(this.message);
}
