import 'package:bloc/bloc.dart';
import 'package:cafe_pra_ja/ui/cupons/cupons_event.dart';
import 'package:cafe_pra_ja/ui/cupons/cupons_state.dart';

class CuponsBloc extends Bloc<CuponsEvent, CuponsState> {
  CuponsBloc() : super(CuponsInitialState()) {
    on<CuponsEvent>((event, emit) {
      emit(CuponsLoadingState());
      try {
        emit(CuponsSuccessState());
      } catch (e) {
        emit(CuponsErrorState('$e'));
      }
    });
  }
}
