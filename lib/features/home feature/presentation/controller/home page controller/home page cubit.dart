import 'package:dartz/dartz.dart';
import 'package:dribbox/core/resources/folders.dart';
import 'package:dribbox/core/services/storage.dart';
import 'package:dribbox/features/home%20feature/domain/usecase/pick%20file%20by%20folder%20use%20case.dart';
import 'package:dribbox/features/home%20feature/presentation/controller/folder%20files%20controller/folder%20files%20cubit.dart';
import 'package:dribbox/features/home%20feature/presentation/controller/load%20all%20data%20controller/load%20all%20data%20cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

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

  bool isAllView = false;
  int itemIndex = 0;

   uploadFile(BuildContext context)async{
    emit(HomePageLoadingState());
      Either<Failure, FileProperties> file = await sl<PickFileUseCase>().execute();
      file.fold((l)=>emit(HomePageFailureState(l.message)), (r) async{
        Either<Failure, UploadedFileProperties> data = await sl<UploadFileUseCase>().execute(r);
        data.fold((l)=>emit(HomePageFailureState(l.message)), (r)async{

         String date =   DateFormat('MMMM d, yyyy').format(DateTime.now());
         Logger().w('dateeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee  ${r.type} $date');

         await writeData(r.type, date);
          emit(HomePageSuccessState('File uploaded successfully'));
          await BlocProvider.of<LoadAllDataCubit>(context).loadAllData();
         /// await BlocProvider.of<FolderFilesCubit>(context).loadAllData();

        });
      });



  }

  uploadFileByFolder(BuildContext context,FolderProperties folder)async{
    emit(HomePageLoadingState());
      Either<Failure, FileProperties> file = await sl<PickFileByFolderUseCase>().execute(folder);
      file.fold((l)=>emit(HomePageFailureState(l.message)), (r) async{
        Either<Failure, UploadedFileProperties> data = await sl<UploadFileUseCase>().execute(r);
        data.fold((l)=>emit(HomePageFailureState(l.message)), (r)async{

          String date =   DateFormat('MMMM d, yyyy').format(DateTime.now());
          Logger().w('dateeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee  ${folder.name} $date');

          await writeData(r.type, date);
          emit(HomePageSuccessState('File uploaded successfully'));
          await BlocProvider.of<LoadAllDataCubit>(context).loadAllData();
          await BlocProvider.of<FolderFilesCubit>(context).getItemsByFolder(folder);
          /// await BlocProvider.of<FolderFilesCubit>(context).loadAllData();

        });
      });



  }


  toggleView(){
    isAllView = !isAllView;
    emit(HomePageSwitchState());
  }



   deleteFile(BuildContext context,FolderItems file,int index,FolderProperties folder)async{
     itemIndex = index;

     emit(HomePageDeleteLoadingState());
    try{
      String date =   DateFormat('MMMM d, yyyy').format(DateTime.now());
      Logger().w('dateeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee  ${folder.name} $date');
      await writeData(folder.name, date);
      await deleteFileFunction(file);
      await BlocProvider.of<LoadAllDataCubit>(context).loadAllData();
      await BlocProvider.of<FolderFilesCubit>(context).getItemsByFolder(folder);

      emit(HomePageDeleteSuccessState('File deleted successfully'));

    }
    catch(e){
      emit(HomePageDeleteFailureState('Error deleting file'));
    }

  }

  @override
  void onChange(Change<HomePageState> change) {
    // TODO: implement onChange
    super.onChange(change);
    Logger().i(change);
  }

}