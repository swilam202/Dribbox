import 'package:dribbox/core/resources/folders.dart';
import 'package:dribbox/features/home%20feature/presentation/controller/home%20page%20controller.dart';
import 'package:dribbox/features/home%20feature/presentation/widgets/file%20item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FolderPage extends StatelessWidget {
  const FolderPage({super.key,required this.folder});
  final FolderProperties folder;
  @override
  Widget build(BuildContext context) {
    final HomePageController homePageController = Get.put(HomePageController());
    return Scaffold(
        body: FutureBuilder(future: homePageController.getItemsByFolder(folder),
          builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          else {
            if(homePageController.getItemsByFolderSuccess.value){
              return  ListView.builder(
                itemCount: homePageController.folderFiles.length,
                itemBuilder: (context, index) {
                  return FileItem(folder: folder, file: homePageController.folderFiles[index]);
                },
              );
            }
            else{
              return Center(child: Text(homePageController.folderFilesErrorMessage.value));
            }
        }
        },)
    );
  }
}
