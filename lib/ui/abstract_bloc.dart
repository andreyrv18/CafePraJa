import 'package:bloc/bloc.dart';
import 'package:cafe_pra_ja/ui/abstract_event.dart';
import 'package:cafe_pra_ja/ui/abstract_state.dart';

class AbstractBloc extends Bloc<AbstractEvent, AbstractState> {
  AbstractBloc() : super(AbstractInitial()) {
    on<AbstractEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
