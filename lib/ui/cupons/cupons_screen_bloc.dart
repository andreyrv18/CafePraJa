import 'package:bloc/bloc.dart';
import 'package:cafe_pra_ja/ui/cupons/cupons_screen_event.dart';
import 'package:cafe_pra_ja/ui/cupons/cupons_screen_state.dart';

class CuponsScreenBloc extends Bloc<CuponsScreenEvent, CuponsScreenState> {
  CuponsScreenBloc() : super(CuponsScreenInitialState()) {
    on<CuponsScreenEvent>((event, emit) {
      emit(CuponsScreenLoadingState());
      try {
        emit(CuponsScreenSuccessState());
      } catch (e) {
        emit(CuponsScreenErrorState('$e'));
      }
    });
  }
}
