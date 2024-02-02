import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/services/service locator.dart';
import '../../../data/model/folder items.dart';
import '../../../domain/usecase/get all items use case.dart';
import 'load all data state.dart';

class LoadAllDataCubit extends Cubit<LoadAllDataState> {
  LoadAllDataCubit() : super(LoadAllDataInitialState());

  Future<void> loadAllData() async {
    emit(LoadAllDataLoadingState());
    Either<Failure, List<FolderItems>> data =
        await sl<GetAllItemsUseCase>().execute();
    data.fold((l) => emit(LoadAllDataFailureState(l.message)),
        (r) => emit(LoadAllDataSuccessState(r)));
  }
}
