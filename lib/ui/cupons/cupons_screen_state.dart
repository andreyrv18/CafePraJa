sealed class CuponsScreenState {}

final class CuponsScreenInitialState extends CuponsScreenState {}

class CuponsScreenLoadingState extends CuponsScreenState {}

class CuponsScreenSuccessState extends CuponsScreenState {}

class CuponsScreenErrorState extends CuponsScreenState {
  final String message;
  CuponsScreenErrorState(this.message);
}
