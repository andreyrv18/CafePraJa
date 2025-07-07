import 'package:bloc/bloc.dart';
import 'package:cafe_pra_ja/ui/home/home_screen_event.dart';
import 'package:cafe_pra_ja/ui/home/home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenInitialState()) {
    on<HomeScreenEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<HomeScreenLoadingEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<HomeScreenSuccessEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<HomeScreenErrorEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
