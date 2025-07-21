sealed class HomeScreenEvent {}

class HomeScreenInitialEvent extends HomeScreenEvent {}

class HomeScreenLoadingEvent extends HomeScreenEvent {}

class HomeScreenSuccessEvent extends HomeScreenEvent {}

class HomeScreenErrorEvent extends HomeScreenEvent {
  final String message;
  HomeScreenErrorEvent(this.message);
}

class HomeScreenApplyFilterEvent extends HomeScreenEvent {}