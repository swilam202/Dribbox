import 'package:dribbox/core/resources/folders.dart';
import 'package:dribbox/features/home%20feature/presentation/controller/home%20page%20controller.dart';
import 'package:dribbox/features/home%20feature/presentation/widgets/file%20item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/folder files controller/folder file states.dart';
import '../controller/folder files controller/folder files cubit.dart';

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
      body: BlocBuilder<FolderFilesCubit, FolderFilesState>(
        //listener: (context, state) {},
        builder: (context, state) {
          if (state is FolderFilesSuccessState) {
            return ListView.builder(
              itemCount: state.files.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return FileItem(
                    folder: widget.folder, file: state.files[index], index: index);
              },
            );
          } else if (state is FolderFilesFailureState) {
            return Center(child: Text(state.errorMessage));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
