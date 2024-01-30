import 'package:dribbox/core/resources/folders.dart';
import 'package:dribbox/core/widgets/file%20item.dart';
import 'package:dribbox/features/home%20feature/presentation/controller/home%20page%20controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/models/folder items.dart';
import '../../../../core/services/service locator.dart';
import '../../domain/entites/file properties.dart';
import 'file item.dart';

class HomePageFilesListview extends StatelessWidget {
  const HomePageFilesListview({super.key});

  @override
  Widget build(BuildContext context) {
    final HomePageController homePageController = Get.put(HomePageController());
    return FutureBuilder(
      future: homePageController.getAllItems(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if(homePageController.getAllItemsSuccess.value == true){
            return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: homePageController.allFiles.length,
                shrinkWrap: true,
                itemBuilder: (context,index) {
                  FolderProperties folderProperties = OtherFolderProperties();
                  for (int i = 0; i <
                      (sl<List<FolderProperties>>().length); i++) {
                    if (homePageController.allFiles[index].type ==
                        sl<List<FolderProperties>>()[i].name) {
                      folderProperties = sl<List<FolderProperties>>()[i];
                      break;
                    }
                  }
                  return FileItem(folder: folderProperties, file: homePageController.allFiles[index]);
                }
            );
          }
          else{
            return  Center(
              child: Text(homePageController.allFilesErrorMessage.value),
            );
          }

        }
      },
    );
  }
}
