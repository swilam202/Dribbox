import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../../core/resources/color manager.dart';
import '../../../../core/resources/folders.dart';
import '../../../../core/widgets/loading state.dart';
import '../controller/folder files controller/folder file states.dart';
import '../controller/folder files controller/folder files cubit.dart';
import '../controller/home page controller/home page cubit.dart';
import '../controller/home page controller/home page state.dart';
import '../widgets/file item.dart';
import '../widgets/home page custom app bar.dart';

class FolderPage extends StatefulWidget {
  const FolderPage({super.key, required this.folder});

  final FolderProperties folder;

  @override
  State<FolderPage> createState() => _FolderPageState();
}

class _FolderPageState extends State<FolderPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<FolderFilesCubit>(context).getItemsByFolder(widget.folder);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homePageCustomAppBar(widget.folder),
      body: BlocBuilder<FolderFilesCubit, FolderFilesState>(
        builder: (context, state) {
          if (state is FolderFilesSuccessState) {
            return ListView.builder(
              itemCount: state.files.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return AnimationConfiguration.staggeredList(
                  duration: const Duration(milliseconds: 1500),
                  position: index,
                  child: SlideAnimation(
                    verticalOffset: 500,
                    horizontalOffset: -500,
                    child: FadeInAnimation(
                      child: FileItem(
                          folder: widget.folder,
                          file: state.files[index],
                          index: index),
                    ),
                  ),
                );
              },
            );
          } else if (state is FolderFilesFailureState) {
            return Center(child: Text(state.errorMessage));
          } else {
            return LoadingState(color: widget.folder.color);
          }
        },
      ),
      floatingActionButton: BlocBuilder<HomePageCubit, HomePageState>(
        builder: (context, state) {
          return FloatingActionButton(
            backgroundColor: widget.folder.color,
            shape: CircleBorder(),
            onPressed: (state is HomePageLoadingState)
                ? null
                : () async {
                    await BlocProvider.of<HomePageCubit>(context)
                        .uploadFileByFolder(context, widget.folder);
                  },
            child: (state is HomePageLoadingState)
                ? CircularProgressIndicator(color: Colors.white)
                : Icon(Icons.cloud_upload, color: ColorManager.whiteColor),
          );
        },
      ),
    );
  }
}
