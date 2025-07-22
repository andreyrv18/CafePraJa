sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeLoadingEvent extends HomeEvent {}

class HomeSuccessEvent extends HomeEvent {}

class HomeErrorEvent extends HomeEvent {
  final String message;
  HomeErrorEvent(this.message);
}

class HomeApplyFilterEvent extends HomeEvent {}