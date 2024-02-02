import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/color manager.dart';
import '../../../../core/resources/font weight manager.dart';
import '../../../../core/resources/style manager.dart';
import '../../../../core/widgets/custom drawer.dart';
import '../controller/home page controller/home page cubit.dart';
import '../controller/home page controller/home page state.dart';
import '../widgets/home page files listview.dart';
import '../widgets/home page folder grid.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDrawer(
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<HomePageCubit, HomePageState>(
            builder: (context, state) {
              return ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                physics: const BouncingScrollPhysics(),
                children: [
                  const SizedBox(height: 20),
                  Text(
                    "Your Dribbox",
                    style: StyleManager.bigTextStyle(
                      fontWeight: FontWeightManager.semiBoldWeight,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 35),
                  Row(
                    children: [
                      DropdownButton(
                        borderRadius: BorderRadius.circular(16),
                        isDense: true,
                        underline: const SizedBox(),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        value:
                            BlocProvider.of<HomePageCubit>(context).isAllView,
                        onChanged: (val) {
                          BlocProvider.of<HomePageCubit>(context).toggleView();
                        },
                        icon: const Icon(Icons.arrow_drop_down_sharp),
                        items: [
                          DropdownMenuItem(
                            value: true,
                            child: Text(
                              'All',
                              style: StyleManager.bigTextStyle(
                                fontSize: 16,
                                fontWeight: FontWeightManager.normalWeight,
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: false,
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
                  BlocProvider.of<HomePageCubit>(context).isAllView
                      ? HomePageFilesListview()
                      : const HomePageFolderGrid(),
                  const SizedBox(height: 20),
                ],
              );
            },
          ),
        ),
        floatingActionButton: BlocBuilder<HomePageCubit, HomePageState>(
          builder: (context, state) {
            return FloatingActionButton(
              backgroundColor: ColorManager.blueColor,
              shape: CircleBorder(),
              onPressed: (state is HomePageLoadingState)
                  ? null
                  : () async {
                      await BlocProvider.of<HomePageCubit>(context)
                          .uploadFile(context);
                    },
              child: (state is HomePageLoadingState)
                  ? CircularProgressIndicator(color: Colors.white)
                  : Icon(Icons.cloud_upload, color: ColorManager.whiteColor),
            );
          },
        ),
      ),
    );
  }
}
