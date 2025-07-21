sealed class HomeScreenState {}

final class HomeScreenInitialState extends HomeScreenState {}

class HomeScreenLoadingState extends HomeScreenState {}

class HomeScreenSuccessState extends HomeScreenState {}

class HomeScreenErrorState extends HomeScreenState {
  final String message;
  HomeScreenErrorState(this.message);
}

class HomeScreenApplyFilterState extends HomeScreenState {}