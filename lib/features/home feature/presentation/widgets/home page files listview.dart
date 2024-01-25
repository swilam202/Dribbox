import 'package:dribbox/core/resources/folders.dart';
import 'package:dribbox/core/widgets/file%20item.dart';
import 'package:flutter/material.dart';

class HomePageFilesListview extends StatelessWidget {
  const HomePageFilesListview({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      shrinkWrap: true,
      itemBuilder: (context,index){
        return FileItem(folder: APKFolderProperties());
      },
    );
  }
}
