import 'package:dribbox/core/resources/folders.dart';
import 'package:dribbox/features/home%20feature/domain/entites/file%20properties.dart';
import 'package:flutter/material.dart';

import '../models/folder items.dart';

class FileItem extends StatelessWidget {
  const FileItem({super.key,required this.folder,required this.file});
  final FolderProperties folder;
  final FolderItems file;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(folder.icon,color: folder.color,),
      title: Text(file.name),
      trailing: const Icon(Icons.more_vert),
    );
  }
}
