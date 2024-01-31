import 'package:dribbox/core/resources/folders.dart';
import 'package:dribbox/core/resources/font%20weight%20manager.dart';
import 'package:dribbox/core/utils/custom%20navigation.dart';
import 'package:dribbox/features/home%20feature/presentation/pages/folder%20page.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/style manager.dart';

class HomePageFolder extends StatelessWidget {
  const HomePageFolder(this.folder,{
    super.key
  });

  final FolderProperties folder;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      splashColor: folder.color.withOpacity(0.05),
      onTap: () {
      //  CustomNavigation.push(FolderPage(folder: folder));
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: folder.color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              folder.icon,
              color: folder.color,
              size: 35,
            ),
            const SizedBox(height: 7),
            Text(
              folder.name,
              style: StyleManager.smallTextStyle(
                fontSize: 15,
                color: folder.color,
                fontWeight: FontWeightManager.semiBoldWeight,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              'December 20.2020',
              style: StyleManager.smallTextStyle(
                fontSize: 10,
                color: folder.color.withOpacity(0.9),
                fontWeight: FontWeightManager.normalWeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
