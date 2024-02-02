import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../../core/resources/color manager.dart';
import '../../../../core/resources/folders.dart';
import '../../../../core/services/service locator.dart';
import '../../../../core/widgets/loading state.dart';
import '../controller/load all data controller/load all data cubit.dart';
import '../controller/load all data controller/load all data state.dart';
import 'file item.dart';

class HomePageFilesListview extends StatefulWidget {
  const HomePageFilesListview({super.key});

  @override
  State<HomePageFilesListview> createState() => _HomePageFilesListviewState();
}

class _HomePageFilesListviewState extends State<HomePageFilesListview> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<LoadAllDataCubit>(context).loadAllData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadAllDataCubit, LoadAllDataState>(
      builder: (context, state) {
        if (state is LoadAllDataSuccessState) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.files.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              FolderProperties folderProperties = OtherFolderProperties();
              for (int i = 0; i < (sl<List<FolderProperties>>().length); i++) {
                if (state.files[index].type ==
                    sl<List<FolderProperties>>()[i].name) {
                  folderProperties = sl<List<FolderProperties>>()[i];
                  break;
                }
              }
              return AnimationConfiguration.staggeredList(
                duration: const Duration(milliseconds: 1500),
                position: index,
                child: SlideAnimation(
                  verticalOffset: 500,
                  horizontalOffset: -500,
                  child: FadeInAnimation(
                    child: FileItem(
                      folder: folderProperties,
                      file: state.files[index],
                      index: index,
                    ),
                  ),
                ),
              );
            },
          );
        } else if (state is LoadAllDataFailureState) {
          return Center(child: Text(state.errorMessage));
        } else {
          return LoadingState(color: ColorManager.blueColor);
        }
      },
    );
  }
}
