import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/resources/folders.dart';
import '../../../../../core/services/service locator.dart';
import '../../../../../core/services/storage.dart';
import '../../../../../core/utils/delete file.dart';
import '../../../data/model/folder items.dart';
import '../../../domain/entites/file properties.dart';
import '../../../domain/entites/uploaded file properties.dart';
import '../../../domain/usecase/pick file by folder use case.dart';
import '../../../domain/usecase/pick file use case.dart';
import '../../../domain/usecase/upload file use case.dart';
import '../folder files controller/folder files cubit.dart';
import '../load all data controller/load all data cubit.dart';
import 'home page state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageInitialState());

  bool isAllView = false;
  int itemIndex = 0;

  Future<void> uploadFile(BuildContext context) async {
    emit(HomePageLoadingState());
    Either<Failure, FileProperties> file =
        await sl<PickFileUseCase>().execute();
    file.fold((l) => emit(HomePageFailureState(l.message)), (r) async {
      Either<Failure, UploadedFileProperties> data =
          await sl<UploadFileUseCase>().execute(r);
      data.fold((l) => emit(HomePageFailureState(l.message)), (r) async {
        String date = DateFormat('MMMM d, yyyy').format(DateTime.now());

        await writeData(r.type, date);
        emit(HomePageSuccessState('File uploaded successfully'));
        await BlocProvider.of<LoadAllDataCubit>(context).loadAllData();
      });
    });
  }

  Future<void> uploadFileByFolder(
      BuildContext context, FolderProperties folder) async {
    emit(HomePageLoadingState());
    Either<Failure, FileProperties> file =
        await sl<PickFileByFolderUseCase>().execute(folder);
    file.fold((l) => emit(HomePageFailureState(l.message)), (r) async {
      Either<Failure, UploadedFileProperties> data =
          await sl<UploadFileUseCase>().execute(r);
      data.fold((l) => emit(HomePageFailureState(l.message)), (r) async {
        String date = DateFormat('MMMM d, yyyy').format(DateTime.now());

        await writeData(r.type, date);
        emit(HomePageSuccessState('File uploaded successfully'));
        await BlocProvider.of<LoadAllDataCubit>(context).loadAllData();
        await BlocProvider.of<FolderFilesCubit>(context)
            .getItemsByFolder(folder);
      });
    });
  }

  void toggleView() {
    isAllView = !isAllView;
    emit(HomePageSwitchState());
  }

  Future<void> deleteFile(BuildContext context, FolderItems file, int index,
      FolderProperties folder) async {
    itemIndex = index;

    emit(HomePageDeleteLoadingState());
    try {
      String date = DateFormat('MMMM d, yyyy').format(DateTime.now());
      await writeData(folder.name, date);
      await deleteFileFunction(file);
      await BlocProvider.of<LoadAllDataCubit>(context).loadAllData();
      await BlocProvider.of<FolderFilesCubit>(context).getItemsByFolder(folder);

      emit(HomePageDeleteSuccessState('File deleted successfully'));
    } catch (e) {
      emit(HomePageDeleteFailureState('Error deleting file'));
    }
  }
}
