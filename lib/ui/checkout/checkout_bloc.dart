import 'package:bloc/bloc.dart';
import 'package:cafe_pra_ja/ui/checkout/checkout_event.dart';
import 'package:cafe_pra_ja/ui/checkout/checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc() : super(CheckoutInitialState()) {
    on<CheckoutEvent>((event, emit) {
      emit(CheckoutLoadingState());
      try {
        emit(CheckoutSuccessState());
      } catch (e) {
        emit(CheckoutErrorState('$e'));
      }
    });
  }
}
