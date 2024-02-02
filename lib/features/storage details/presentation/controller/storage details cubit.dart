import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/services/service locator.dart';
import '../../domain/entites/section.dart';
import '../../domain/usecase/get storage details use case.dart';
import 'storage details state.dart';

class StorageDetailsCubit extends Cubit<StorageDetailsState> {
  StorageDetailsCubit() : super(StorageDetailsInitialState());

  getStorageDetails() async {
    emit(StorageDetailsLoadingState());
    Either<Failure, List<Section>> data =
        await sl<GetStorageDetailsUseCase>().execute();
    data.fold((l) => emit(StorageDetailsFailureState(l.message)), (r) {
      num total = 0;
      for (int i = 0; i < r.length; i++) {
        total += r[i].value;
      }
      emit(StorageDetailsSuccessState(r, total));
    });
  }
}
