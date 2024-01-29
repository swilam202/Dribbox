import 'package:dribbox/core/resources/folders.dart';
import 'package:dribbox/core/resources/style%20manager.dart';
import 'package:dribbox/core/utils/delete%20file.dart';
import 'package:dribbox/features/home%20feature/domain/entites/file%20properties.dart';
import 'package:flutter/material.dart';

import '../models/folder items.dart';
import '../utils/calculate size.dart';

class FileItem extends StatelessWidget {
  const FileItem({super.key,required this.folder,required this.file});
  final FolderProperties folder;
  final FolderItems file;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(folder.icon,color: folder.color,),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(file.name,maxLines: 1,overflow: TextOverflow.ellipsis),
          Text(calculateSize(file.size),style: StyleManager.smallTextStyle()),
        ],
      ),
      trailing: IconButton(
        onPressed: ()async{
          await deleteFile(file);
        },
        icon: const Icon(Icons.more_vert),
      )
    );
  }
}
