import 'package:flutter/material.dart';

import '../../../../core/resources/folders.dart';
import '../../../../core/services/service locator.dart';
import 'home page folder.dart';

class HomePageFolderGrid extends StatelessWidget {
  const HomePageFolderGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 30,
        mainAxisSpacing: 30,
      ),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: sl<List<FolderProperties>>().length,
      itemBuilder: (context, index) {
        return HomePageFolder(sl<List<FolderProperties>>()[index]);
      },
    );
  }
}
