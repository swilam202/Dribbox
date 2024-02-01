import 'package:dribbox/core/resources/color%20manager.dart';
import 'package:dribbox/core/resources/folders.dart';
import 'package:dribbox/core/widgets/loading%20state.dart';
import 'package:dribbox/features/home%20feature/presentation/controller/home%20page%20controller.dart';
import 'package:dribbox/features/home%20feature/presentation/controller/home%20page%20controller/home%20page%20state.dart';
import 'package:dribbox/features/home%20feature/presentation/widgets/file%20item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../controller/folder files controller/folder file states.dart';
import '../controller/folder files controller/folder files cubit.dart';
import '../controller/home page controller/home page cubit.dart';
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
    //final HomePageController homePageController = Get.put(HomePageController());
    return Scaffold(
      appBar: homePageCustomAppBar(widget.folder),
      body: BlocConsumer<FolderFilesCubit, FolderFilesState>(
        listener: (context, state) async {
          if (state is HomePageDeleteSuccessState) {
            // await BlocProvider.of<FolderFilesCubit>(context).getItemsByFolder(widget.folder);
          }
        },
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
                ?null
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

      /*FloatingActionButton(
        onPressed:  () async{
    await BlocProvider.of<HomePageCubit>(context).uploadFileByFolder(context,widget.folder);
    },
        backgroundColor: widget.folder.color,
        shape: CircleBorder(),
        child:  BlocBuilder<HomePageCubit,HomePageState>(
          builder: (context, state) {
            if(state is HomePageLoadingState){
              return CircularProgressIndicator(color: Colors.white,);
            }else{
              return Icon(Icons.cloud_upload);
            }
          }
          ,
        ),
      ),*/
    );
  }
}
