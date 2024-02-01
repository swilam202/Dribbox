import 'package:dio/dio.dart';
import 'package:dribbox/core/resources/color%20manager.dart';
import 'package:dribbox/core/resources/folders.dart';
import 'package:dribbox/core/resources/style%20manager.dart';
import 'package:dribbox/core/utils/delete%20file.dart';
import 'package:dribbox/core/utils/launch%20file.dart';
import 'package:dribbox/core/utils/toast%20status.dart';
import 'package:dribbox/core/widgets/custom%20toast.dart';
import 'package:dribbox/features/home%20feature/domain/entites/file%20properties.dart';
import 'package:dribbox/features/home%20feature/presentation/controller/home%20page%20controller/home%20page%20cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/service locator.dart';
import '../../../../core/utils/calculate size.dart';
import '../../data/model/folder items.dart';
import '../controller/home page controller.dart';
import '../controller/home page controller/home page state.dart';
import '../controller/load all data controller/load all data cubit.dart';


class FileItem extends StatelessWidget {
  const FileItem({super.key,required this.folder,required this.file,required this.index,});
  final FolderProperties folder;
  final FolderItems file;
  final int index;

  @override
  Widget build(BuildContext context) {
    //final HomePageController homePageController = HomePageController();



    return  BlocConsumer<HomePageCubit,HomePageState>(
        listener: (context, state)async {
          if(state is HomePageSuccessState){
            await customToast(state.successMessage, ToastStatus.success);
          }
          else if(state is HomePageFailureState){
            await customToast(state.errorMessage, ToastStatus.error);
          }
          else if(state is HomePageDeleteFailureState)
            await customToast(state.errorMessage, ToastStatus.error);
          else if(state is HomePageDeleteSuccessState){
            await customToast(state.successMessage, ToastStatus.success);
          }
        },
        builder: (context, state) {
          return ListTile(
            leading: Icon(folder.icon,color: folder.color,),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(file.name,maxLines: 1,overflow: TextOverflow.ellipsis),
                Text(calculateSize(file.size),style: StyleManager.smallTextStyle()),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(

                  onPressed: ()async{
                    await  BlocProvider.of<HomePageCubit>(context).deleteFile(context,file,index,folder);


                  }, /*homePageController.isDeleting.value == true? null:()async{
            await homePageController.deleteFile(file);
          },*/
                  icon: (state is HomePageDeleteLoadingState && (index == BlocProvider.of<HomePageCubit>(context).itemIndex))? CircularProgressIndicator(color: ColorManager.redColor,):Icon(Icons.delete,color: ColorManager.redColor,),



                  // homePageController.isDeleting.value == true?const CircularProgressIndicator(color: ColorManager.redColor):const Icon(Icons.delete,color: ColorManager.redColor,),
                ),IconButton(
                  onPressed: ()async{
                    await launchFile(file.url);
                  },
                  icon: const Icon(Icons.cloud_download_rounded,color: ColorManager.blueColor,),
                ),

              ],
            )
          );
        },

    );
  }
}