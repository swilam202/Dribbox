import 'package:dartz/dartz.dart';
import 'package:dribbox/features/storage%20details/domain/usecase/get%20storage%20details%20use%20case.dart';
import 'package:dribbox/features/storage%20details/presentation/controller/storage%20details%20state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/services/service locator.dart';
import '../../domain/entites/section.dart';

class StorageDetailsCubit extends Cubit<StorageDetailsState>{
  StorageDetailsCubit():super(StorageDetailsInitialState());
  getStorageDetails()async{
    emit(StorageDetailsLoadingState());
    Either<Failure, List<Section>> data = await sl<GetStorageDetailsUseCase>().execute();
    data.fold((l) => emit(StorageDetailsFailureState(l.message)), (r) {
     num total = 0;
      for(int i=0;i<r.length;i++){
        total += r[i].value;
      }
      emit(StorageDetailsSuccessState(r,total));
    });
  }
}