sealed class CuponsState {}

final class CuponsInitialState extends CuponsState {}

class CuponsLoadingState extends CuponsState {}

class CuponsSuccessState extends CuponsState {}

class CuponsErrorState extends CuponsState {
  final String message;
  CuponsErrorState(this.message);
}
