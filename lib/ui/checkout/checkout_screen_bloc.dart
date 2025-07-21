import 'package:bloc/bloc.dart';
import 'package:cafe_pra_ja/ui/checkout/checkout_screen_event.dart';
import 'package:cafe_pra_ja/ui/checkout/checkout_screen_state.dart';

class CheckoutScreenBloc extends Bloc<CheckoutScreenEvent, CheckoutScreenState> {
  CheckoutScreenBloc() : super(CheckoutScreenInitialState()) {
    on<CheckoutScreenEvent>((event, emit) {
      emit(CheckoutScreenLoadingState());
      try {
        emit(CheckoutScreenSuccessState());
      } catch (e) {
        emit(CheckoutScreenErrorState('$e'));
      }
    });
  }
}
