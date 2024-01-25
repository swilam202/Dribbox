import 'package:get/get.dart';

class HomePageController extends GetxController{
  RxBool folderView = true.obs;
  void toggleView(){
    folderView.value = !(folderView.value);
  }

}