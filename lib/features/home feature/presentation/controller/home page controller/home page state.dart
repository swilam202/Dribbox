abstract class HomePageState {}

class HomePageInitialState extends HomePageState {}

class HomePageLoadingState extends HomePageState {}

class HomePageSuccessState extends HomePageState {
  final String successMessage;

  HomePageSuccessState(this.successMessage);
}

class HomePageFailureState extends HomePageState {
  final String errorMessage;

  HomePageFailureState(this.errorMessage);
}

class HomePageSwitchState extends HomePageState {}

class HomePageDeleteState extends HomePageState {}

class HomePageDeleteLoadingState extends HomePageState {}

class HomePageDeleteSuccessState extends HomePageState {
  final String successMessage;

  HomePageDeleteSuccessState(this.successMessage);
}

class HomePageDeleteFailureState extends HomePageState {
  final String errorMessage;

  HomePageDeleteFailureState(this.errorMessage);
}
