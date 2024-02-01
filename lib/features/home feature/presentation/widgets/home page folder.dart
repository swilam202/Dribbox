import 'package:dribbox/core/resources/folders.dart';
import 'package:dribbox/core/resources/font%20weight%20manager.dart';
import 'package:dribbox/core/services/storage.dart';
import 'package:dribbox/core/utils/custom%20navigation.dart';
import 'package:dribbox/features/home%20feature/presentation/controller/folder%20files%20controller/folder%20files%20cubit.dart';
import 'package:dribbox/features/home%20feature/presentation/pages/folder%20page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

import '../../../../core/resources/style manager.dart';



class HomePageFolder extends StatelessWidget {

  const HomePageFolder(this.folder,{super.key});

  final FolderProperties folder;

  

  

  Future<String?> getDate()async{
  String? date = await readData(folder.name);
   Logger().i('dateeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee $date');
   return date;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: getDate(), builder: (context, snapshot) => InkWell(
      borderRadius: BorderRadius.circular(20),
      splashColor: folder.color.withOpacity(0.05),
      onTap: () async{
        CustomNavigation.push(FolderPage(folder: folder));
        ///Navigator.of(context).push(MaterialPageRoute(builder: (context) => FolderPage(folder: folder),));
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
              snapshot.data ?? '',
              style: StyleManager.smallTextStyle(
                fontSize: 10,
                color: folder.color.withOpacity(0.9),
                fontWeight: FontWeightManager.normalWeight,
              ),
            ),
          ],
        ),
      ),
    ),);
  }
}
