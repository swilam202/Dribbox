import 'package:flutter/material.dart';

import '../../../../core/resources/folders.dart';
import '../../../../core/resources/style manager.dart';
import '../../../../core/utils/custom navigation.dart';

PreferredSizeWidget? homePageCustomAppBar(FolderProperties folder) {
  return AppBar(
    backgroundColor: folder.color.withOpacity(0.2),
    centerTitle: true,
    leading: IconButton(
      onPressed: () {
        CustomNavigation.pop();
      },
      icon: Icon(
        Icons.arrow_back_ios,
        color: folder.color,
      ),
    ),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          folder.icon,
          color: folder.color,
        ),
        SizedBox(width: 10),
        Text(
          folder.name,
          style: StyleManager.bigTextStyle(fontSize: 20),
        ),
      ],
    ),
    elevation: 0,
  );
}
