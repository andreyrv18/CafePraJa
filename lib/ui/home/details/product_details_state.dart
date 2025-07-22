sealed class ProductDetailState {}

final class ProductDetailInitialState extends ProductDetailState {}

class ProductDetailLoadingState extends ProductDetailState {}

class ProductDetailSuccessState extends ProductDetailState {}

class ProductDetailErrorState extends ProductDetailState {
  final String message;
  ProductDetailErrorState(this.message);
}
