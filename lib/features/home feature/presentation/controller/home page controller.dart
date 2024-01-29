import 'package:dartz/dartz.dart';
import 'package:dribbox/core/models/folder%20items.dart';
import 'package:dribbox/core/widgets/custom%20toast.dart';
import 'package:dribbox/features/home%20feature/data/data%20source/home%20page%20base%20remote%20data%20source.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/services/service locator.dart';
import '../../domain/entites/file properties.dart';
import '../../domain/entites/uploaded file properties.dart';
import '../../domain/usecase/get all items use case.dart';
import '../../domain/usecase/pick file use case.dart';
import '../../domain/usecase/upload file use case.dart';

class HomePageController extends GetxController{
  RxBool folderView = false.obs;
  RxBool isRight = true.obs;
  RxString errorMessage = ''.obs;
  void toggleView(){
    folderView.value = !(folderView.value);
  }

  HomePageRemoteDataSource homePageRemoteDataSource = HomePageRemoteDataSource();
  RxList<FolderItems> files = <FolderItems>[].obs;
 /* load()async{
    files.value = await homePageRemoteDataSource.getAllItems();
    Logger().i(files.value);
  }*/

  getAllItems()async{
    Either<Failure, List<FolderItems>> data = await sl<GetAllItemsUseCase>().execute();
    Logger().i('data is $data');
    data.fold((l) {
      errorMessage.value = l.message;
      isRight.value = false;
    }, (r) {
      isRight.value = true;
      files.value = r;
    });

  }

  uploadFile()async{
    Either<Failure, FileProperties> file = await sl<PickFileUseCase>().execute();
    file.fold((l) => customToast(l.message), (r) async{
      Either<Failure, UploadedFileProperties> data = await sl<UploadFileUseCase>().execute(r);
      data.fold((l) => customToast(l.message), (r) => customToast('File uploaded successfully'));
    });

  }

}