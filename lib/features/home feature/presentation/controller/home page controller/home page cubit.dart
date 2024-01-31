import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/services/service locator.dart';
import '../../../../../core/utils/delete file.dart';
import '../../../data/model/folder items.dart';
import '../../../domain/entites/file properties.dart';
import '../../../domain/entites/uploaded file properties.dart';
import '../../../domain/usecase/pick file use case.dart';
import '../../../domain/usecase/upload file use case.dart';
import 'home page state.dart';

class HomePageCubit extends Cubit<HomePageState>{
  HomePageCubit() : super(HomePageInitialState());

   uploadFile()async{
    emit(HomePageLoadingState());

      Either<Failure, FileProperties> file = await sl<PickFileUseCase>().execute();
      file.fold((l)=>emit(HomePageFailureState(l.message)), (r) async{
        Either<Failure, UploadedFileProperties> data = await sl<UploadFileUseCase>().execute(r);
        data.fold((l)=>emit(HomePageFailureState(l.message)), (r)=>emit(HomePageSuccessState('File uploaded successfully')));
      });




  }


   deleteFile(FolderItems file)async{
    emit(HomePageLoadingState());
    try{
      await deleteFileFunction(file);
      emit(HomePageSuccessState('File deleted successfully'));
    }
    catch(e){
      emit(HomePageFailureState('Error deleting file'));
    }

  }

}