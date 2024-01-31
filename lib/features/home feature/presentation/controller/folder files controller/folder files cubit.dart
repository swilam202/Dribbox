import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/resources/folders.dart';
import '../../../../../core/services/service locator.dart';
import '../../../data/model/folder items.dart';
import '../../../domain/usecase/get items by folder use case.dart';
import 'folder file states.dart';

class FolderFilesCubit extends Cubit<FolderFilesState>{
  FolderFilesCubit() : super(FolderFilesInitialState());


   getItemsByFolder(FolderProperties folder)async{
     emit(FolderFilesLoadingState());
    Either<Failure, List<FolderItems>> response = await sl<GetItemsByFolderUseCase>().execute(folder);
    response.fold(
            (l) => emit(FolderFilesFailureState(l.message)),
            (r) => emit(FolderFilesSuccessState(r)),
    );


  }

  @override
  void onChange(Change<FolderFilesState> change) {
    // TODO: implement onChange
    super.onChange(change);
    Logger().t(change);
  }
}