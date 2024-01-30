

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../../../../core/resources/folders.dart';
import '../../../../core/widgets/file item.dart';
import '../../data/data source/folder page base data source.dart';
import '../../data/model/folder items model.dart';

class FolderPage extends StatefulWidget {
  const FolderPage({super.key});

  @override
  State<FolderPage> createState() => _FolderPageState();
}

class _FolderPageState extends State<FolderPage> {



 Future<List<FolderItemsModel>> load()async{
    FolderPageRemoteDateSource folderPageRemoteDateSource = FolderPageRemoteDateSource();
    List<FolderItemsModel> a = await folderPageRemoteDateSource.getItemsByFolder(ImagesFolderProperties());
    Logger().e('aaaaaaaaaaaaaaaaaaaaaaa $a');
    return a;
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: FutureBuilder(
        future: load(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }
          else{
           return ListView.builder(
              itemCount: snapshot.data!.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return FileItem(folder: ImagesFolderProperties(), file: snapshot.data![index]);
              },
            );
          }
        },
      )
    );
  }
}
