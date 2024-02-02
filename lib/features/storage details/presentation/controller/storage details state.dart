import '../../domain/entites/section.dart';

abstract class StorageDetailsState {}

class StorageDetailsInitialState extends StorageDetailsState {}

class StorageDetailsLoadingState extends StorageDetailsState {}

class StorageDetailsSuccessState extends StorageDetailsState {
  final List<Section> sections;
  final num total;

  StorageDetailsSuccessState(this.sections, this.total);
}

class StorageDetailsFailureState extends StorageDetailsState {
  final String errorMessage;

  StorageDetailsFailureState(this.errorMessage);
}
