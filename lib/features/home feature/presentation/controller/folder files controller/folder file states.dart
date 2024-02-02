import '../../../data/model/folder items.dart';

abstract class FolderFilesState {}

class FolderFilesInitialState extends FolderFilesState {}

class FolderFilesLoadingState extends FolderFilesState {}

class FolderFilesSuccessState extends FolderFilesState {
  final List<FolderItems> files;

  FolderFilesSuccessState(this.files);
}

class FolderFilesFailureState extends FolderFilesState {
  final String errorMessage;

  FolderFilesFailureState(this.errorMessage);
}
