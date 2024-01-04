import 'package:dribbox/core/resources/folders.dart';
import 'package:dribbox/core/resources/font%20weight%20manager.dart';
import 'package:dribbox/core/resources/style%20manager.dart';
import 'package:dribbox/features/home%20feature/data/data%20source/home%20page%20base%20local%20data%20source.dart';
import 'package:dribbox/features/home%20feature/data/repository/home%20page%20repository.dart';
import 'package:dribbox/features/home%20feature/domain/repository/home%20page%20base%20repository.dart';
import 'package:dribbox/features/home%20feature/domain/usecase/pick%20file%20use%20case.dart';
import 'package:dribbox/features/home%20feature/presentation/widgets/home%20page%20folder.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../../../../core/services/service locator.dart';
import '../../../../core/utils/file picker.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 20),
            Text(
              'Your dribBox',
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
                  value: 2,
                  onChanged: (val) {},
                  icon: const Icon(Icons.arrow_drop_down_sharp),
                  items: [
                    DropdownMenuItem(
                      value: 1,
                      child: Text(
                        'All',
                        style: StyleManager.bigTextStyle(
                          fontSize: 16,
                          fontWeight: FontWeightManager.normalWeight,
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: 2,
                      child: Text(
                        'Folders',
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
            GridView.builder(
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
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async{/*
          HomePageBaseLocalDataSource homePageBaseLocalDataSource = HomePageLocalDataSource();
          HomePageBaseRepository homePageBaseRepository = HomePageRepository(homePageBaseLocalDataSource);
         PickFileUseCase pickFileUseCase = PickFileUseCase(homePageBaseRepository);
         var res = await pickFileUseCase.execute();
         Logger().t(res);*/
        },

        child: const Icon(Icons.add),
      ),
    );
  }
}
