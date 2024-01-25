import 'package:dribbox/core/resources/folders.dart';
import 'package:dribbox/core/widgets/file%20item.dart';
import 'package:flutter/material.dart';

import '../../../../core/models/folder items.dart';
import '../../domain/entites/file properties.dart';

class HomePageFilesListview extends StatelessWidget {
  const HomePageFilesListview({super.key,required this.files});
  final List<FolderItems> files;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: files.length,
      shrinkWrap: true,
      itemBuilder: (context,index){
        return FileItem(folder: APKFolderProperties(),file: files[index],);
      },
    );
  }
}
