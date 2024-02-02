import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/color manager.dart';
import '../../../../core/resources/folders.dart';
import '../../../../core/resources/style manager.dart';
import '../../../../core/utils/calculate size.dart';
import '../../../../core/utils/launch file.dart';
import '../../../../core/utils/toast status.dart';
import '../../../../core/widgets/custom toast.dart';
import '../../data/model/folder items.dart';
import '../controller/home page controller/home page cubit.dart';
import '../controller/home page controller/home page state.dart';

class FileItem extends StatelessWidget {
  const FileItem({
    super.key,
    required this.folder,
    required this.file,
    required this.index,
  });

  final FolderProperties folder;
  final FolderItems file;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit, HomePageState>(
      listener: (context, state) async {
        if (state is HomePageSuccessState) {
          await customToast(state.successMessage, ToastStatus.success);
        } else if (state is HomePageFailureState) {
          await customToast(state.errorMessage, ToastStatus.error);
        } else if (state is HomePageDeleteFailureState)
          await customToast(state.errorMessage, ToastStatus.error);
        else if (state is HomePageDeleteSuccessState) {
          await customToast(state.successMessage, ToastStatus.success);
        }
      },
      builder: (context, state) {
        return ListTile(
          leading: Icon(
            folder.icon,
            color: folder.color,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(file.name, maxLines: 1, overflow: TextOverflow.ellipsis),
              Text(calculateSize(file.size),
                  style: StyleManager.smallTextStyle()),
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () async {
                  await BlocProvider.of<HomePageCubit>(context)
                      .deleteFile(context, file, index, folder);
                },
                icon: (state is HomePageDeleteLoadingState &&
                        (index ==
                            BlocProvider.of<HomePageCubit>(context).itemIndex))
                    ? CircularProgressIndicator(
                        color: ColorManager.redColor,
                      )
                    : Icon(
                        Icons.delete,
                        color: ColorManager.redColor,
                      ),
              ),
              IconButton(
                onPressed: () async {
                  await launchFile(file.url);
                },
                icon: const Icon(
                  Icons.cloud_download_rounded,
                  color: ColorManager.blueColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
