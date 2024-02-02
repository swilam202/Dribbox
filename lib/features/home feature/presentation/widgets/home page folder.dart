import 'package:flutter/material.dart';

import '../../../../core/resources/folders.dart';
import '../../../../core/resources/font weight manager.dart';
import '../../../../core/resources/style manager.dart';
import '../../../../core/services/storage.dart';
import '../../../../core/utils/custom navigation.dart';
import '../pages/folder page.dart';

class HomePageFolder extends StatelessWidget {
  const HomePageFolder(this.folder, {super.key});

  final FolderProperties folder;

  Future<String?> getDate() async {
    String? date = await readData(folder.name);
    return date;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getDate(),
      builder: (context, snapshot) => InkWell(
        borderRadius: BorderRadius.circular(20),
        splashColor: folder.color.withOpacity(0.05),
        onTap: () async {
          CustomNavigation.push(FolderPage(folder: folder));
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
      ),
    );
  }
}
