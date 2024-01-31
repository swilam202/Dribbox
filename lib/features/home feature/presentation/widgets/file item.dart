import 'package:dio/dio.dart';
import 'package:dribbox/core/resources/color%20manager.dart';
import 'package:dribbox/core/resources/folders.dart';
import 'package:dribbox/core/resources/style%20manager.dart';
import 'package:dribbox/core/utils/delete%20file.dart';
import 'package:dribbox/features/home%20feature/domain/entites/file%20properties.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/calculate size.dart';
import '../../data/model/folder items.dart';
import '../controller/home page controller.dart';


class FileItem extends StatelessWidget {
  const FileItem({super.key,required this.folder,required this.file});
  final FolderProperties folder;
  final FolderItems file;

  @override
  Widget build(BuildContext context) {
    //final HomePageController homePageController = HomePageController();
    return ListTile(
      leading: Icon(folder.icon,color: folder.color,),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(file.name,maxLines: 1,overflow: TextOverflow.ellipsis),
          Text(calculateSize(file.size),style: StyleManager.smallTextStyle()),
        ],
      ),
      trailing:IconButton(
          onPressed: ()async{
            String url = '';
            String path = '';
            Dio dio = Dio();
           // var res = dio.download(url, path,deleteOnError: true);

          }, /*homePageController.isDeleting.value == true? null:()async{
            await homePageController.deleteFile(file);
          },*/
          icon: Icon(Icons.delete)// homePageController.isDeleting.value == true?const CircularProgressIndicator(color: ColorManager.redColor):const Icon(Icons.delete,color: ColorManager.redColor,),
      ),
    );
  }
}