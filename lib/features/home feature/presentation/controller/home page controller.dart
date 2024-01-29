import 'package:dartz/dartz.dart';
import 'package:dribbox/core/models/folder%20items.dart';
import 'package:dribbox/core/utils/toast%20status.dart';
import 'package:dribbox/core/widgets/custom%20toast.dart';
import 'package:dribbox/features/home%20feature/data/data%20source/home%20page%20base%20remote%20data%20source.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/services/service locator.dart';
import '../../../../core/utils/delete file.dart';
import '../../domain/entites/file properties.dart';
import '../../domain/entites/uploaded file properties.dart';
import '../../domain/usecase/get all items use case.dart';
import '../../domain/usecase/pick file use case.dart';
import '../../domain/usecase/upload file use case.dart';

class HomePageController extends GetxController{
  RxBool folderView = false.obs;
  RxBool isRight = true.obs;
  RxString errorMessage = ''.obs;
  RxBool isLoading = false.obs;
  RxBool isDeleting = false.obs;
  void toggleView(){
    folderView.value = !(folderView.value);
  }


  //HomePageRemoteDataSource homePageRemoteDataSource = HomePageRemoteDataSource();
  RxList<FolderItems> files = <FolderItems>[].obs;
 /* load()async{
    files.value = await homePageRemoteDataSource.getAllItems();
    Logger().i(files.value);
  }*/

  Future<void> getAllItems()async{
    isLoading.value = true;
    Either<Failure, List<FolderItems>> data = await sl<GetAllItemsUseCase>().execute();
    Logger().i('data is $data');
    data.fold((l) {
      errorMessage.value = l.message;
      isRight.value = false;
    }, (r) {
      isRight.value = true;
      files.value = r;
    });
  Logger().i('filsssssssssssssssssssssssssss $files');
    isLoading.value = false;
  }

  Future<void> uploadFile()async{

    Either<Failure, FileProperties> file = await sl<PickFileUseCase>().execute();
    file.fold((l)async => await customToast(l.message,ToastStatus.error), (r) async{
      Logger().d('rrrrrrrrrrrrrr $r');
      Either<Failure, UploadedFileProperties> data = await sl<UploadFileUseCase>().execute(r);
      data.fold((l)async => await customToast(l.message,ToastStatus.error), (r) async{
        await customToast('File uploaded successfully',ToastStatus.success);
      });
    });

  }

  Future<void> deleteFile(FolderItems file)async{
    isDeleting.value = true;
    await deleteFileFunction(file);
    update();
    isDeleting.value = false;
  }


}