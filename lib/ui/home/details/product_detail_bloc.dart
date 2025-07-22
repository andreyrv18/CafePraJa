import 'package:bloc/bloc.dart';
import 'package:cafe_pra_ja/ui/home/details/product_detail_event.dart';
import 'package:cafe_pra_ja/ui/home/details/product_details_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  ProductDetailBloc() : super(ProductDetailInitialState()) {
    on<ProductDetailEvent>((event, emit) {
      emit(ProductDetailLoadingState());
      try {
        emit(ProductDetailSuccessState());
      } catch (e) {
        emit(ProductDetailErrorState('$e'));
      }
    });
  }
}
