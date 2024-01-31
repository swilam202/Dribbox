import 'package:dribbox/core/resources/folders.dart';
import 'package:dribbox/core/resources/style%20manager.dart';
import 'package:dribbox/core/utils/custom%20navigation.dart';
import 'package:flutter/material.dart';


PreferredSizeWidget? homePageCustomAppBar(FolderProperties folder) {
  return AppBar(
    backgroundColor: folder.color.withOpacity(0.2),
    centerTitle: true,
    leading: IconButton(
      onPressed: (){
        CustomNavigation.pop();
      },
      icon:
      Icon(Icons.arrow_back_ios,color: folder.color,),
    ),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(folder.icon,color: folder.color,),
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
