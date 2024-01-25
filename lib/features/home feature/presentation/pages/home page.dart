import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dribbox/core/resources/folders.dart';
import 'package:dribbox/core/resources/font%20weight%20manager.dart';
import 'package:dribbox/core/resources/style%20manager.dart';
import 'package:dribbox/features/folder%20feature/data/data%20source/folder%20page%20base%20data%20source.dart';
import 'package:dribbox/features/home%20feature/data/data%20source/home%20page%20base%20local%20data%20source.dart';
import 'package:dribbox/features/home%20feature/data/data%20source/home%20page%20base%20remote%20data%20source.dart';
import 'package:dribbox/features/home%20feature/data/repository/home%20page%20repository.dart';
import 'package:dribbox/features/home%20feature/domain/repository/home%20page%20base%20repository.dart';
import 'package:dribbox/features/home%20feature/domain/usecase/pick%20file%20use%20case.dart';
import 'package:dribbox/features/home%20feature/presentation/controller/home%20page%20controller.dart';
import 'package:dribbox/features/home%20feature/presentation/widgets/home%20page%20folder%20grid.dart';
import 'package:dribbox/features/home%20feature/presentation/widgets/home%20page%20folder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../../core/models/folder items.dart';
import '../../../../core/services/service locator.dart';
import '../../../../core/utils/file picker.dart';
import '../../data/model/file properties model.dart';
import '../../data/model/uploaded file properties model.dart';
import '../../domain/entites/file properties.dart';
import '../widgets/home page files listview.dart';



class HomePage extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
  final HomePageController homePageController = Get.put(HomePageController());
    return Scaffold(
      body: SafeArea(
        child: Obx(
            ()=>ListView(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              physics: const BouncingScrollPhysics(),
              children: [
                const SizedBox(height: 20),
                Text(
                  'Your dribbox',
                  style: StyleManager.bigTextStyle(
                    fontWeight: FontWeightManager.semiBoldWeight,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 35),
                Row(
                  children: [
                    DropdownButton(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      value: homePageController.folderView.value,
                      onChanged: (val) {
                        homePageController.toggleView();
                      },
                      icon: const Icon(Icons.arrow_drop_down_sharp),
                      items: [
                        DropdownMenuItem(
                          value: false,
                          child: Text(
                            'All',
                            style: StyleManager.bigTextStyle(
                              fontSize: 16,
                              fontWeight: FontWeightManager.normalWeight,
                            ),
                          ),
                        ),
                        DropdownMenuItem(
                          value: true,
                          child: Text(
                            'Folder',
                            style: StyleManager.bigTextStyle(
                              fontSize: 16,
                              fontWeight: FontWeightManager.normalWeight,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                homePageController.folderView.value
                    ? const HomePageFolderGrid()
                    :  HomePageFilesListview(files: homePageController.files,),
                const SizedBox(height: 20),
              ],
            ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async{
          await homePageController.load();
      /* HomePageLocalDataSource homePageLocalDataSource = HomePageLocalDataSource();
          HomePageRemoteDataSource homePageRemoteDataSource = HomePageRemoteDataSource();
          FilePropertiesModel res = await homePageLocalDataSource.pickFile();
          UploadedFilePropertiesModel ress = await homePageRemoteDataSource.uploadFile(res);
          Logger().f(ress);
          QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance.collection('users').where('phone', isEqualTo: '55555').get();
          querySnapshot.docs.forEach((doc) async {
            await doc.reference.update(
              {
                'data':'datdfa',
                /*'files': FieldValue.arrayUnion([{
                  'name':ress.name,
                  'url':ress.url,
                  'size': ress.size,
                }]),*/
              },
            );
          });
          FolderPageRemoteDateSource folderPageRemoteDateSource = FolderPageRemoteDateSource();
          HomePageRemoteDataSource homePageRemoteDataSource = HomePageRemoteDataSource();
        //var res = await folderPageRemoteDateSource.getItemsByFolder(ImagesFolderProperties());
        var res = await homePageRemoteDataSource.getAllItems();
       Logger().t(res);
          */

        },

        child: const Icon(Icons.add),
      ),
    );
  }
}
