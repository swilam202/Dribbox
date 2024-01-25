import 'package:dribbox/core/models/folder%20items.dart';
import 'package:dribbox/features/home%20feature/data/data%20source/home%20page%20base%20remote%20data%20source.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class HomePageController extends GetxController{
  RxBool folderView = true.obs;
  void toggleView(){
    folderView.value = !(folderView.value);
  }

  HomePageRemoteDataSource homePageRemoteDataSource = HomePageRemoteDataSource();
  RxList<FolderItems> files = <FolderItems>[].obs;
  load()async{
    files.value = await homePageRemoteDataSource.getAllItems();
    Logger().i(files.value);
  }

}