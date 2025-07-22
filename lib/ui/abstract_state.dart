
sealed class AbstractState {}

final class AbstractInitial extends AbstractState {}

class AbstractLoadingState extends AbstractState {}

class AbstractSuccessState extends AbstractState {}

class AbstractErrorState extends AbstractState {
  final String message;
  AbstractErrorState(this.message);
}