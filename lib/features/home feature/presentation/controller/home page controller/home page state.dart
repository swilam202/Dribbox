abstract class HomePageState{}
class HomePageInitialState extends HomePageState{}
class HomePageLoadingState extends HomePageState{}
class HomePageSuccessState extends HomePageState{
  final String successMessage;
  HomePageSuccessState(this.successMessage);
}
class HomePageFailureState extends HomePageState{
  final String errorMessage;
  HomePageFailureState(this.errorMessage);
}