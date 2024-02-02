import '../../../data/model/folder items.dart';

abstract class LoadAllDataState {}

class LoadAllDataInitialState extends LoadAllDataState {}

class LoadAllDataLoadingState extends LoadAllDataState {}

class LoadAllDataSuccessState extends LoadAllDataState {
  List<FolderItems> files;

  LoadAllDataSuccessState(this.files);
}

class LoadAllDataFailureState extends LoadAllDataState {
  final String errorMessage;

  LoadAllDataFailureState(this.errorMessage);
}
