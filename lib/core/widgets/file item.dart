import 'package:dribbox/core/resources/folders.dart';
import 'package:flutter/material.dart';

class FileItem extends StatelessWidget {
  const FileItem({super.key,required this.folder});
  final FolderProperties folder;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(folder.icon,color: folder.color,),
      title: Text(folder.name),
      trailing: const Icon(Icons.more_vert),
    );
  }
}
