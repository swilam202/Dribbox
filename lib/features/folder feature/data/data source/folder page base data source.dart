import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';

import '../../../../core/resources/folders.dart';
import '../../../../core/services/storage.dart';
import '../model/folder items model.dart';

abstract class FolderPageBaseRemoteDateSource{
  Future<List<FolderItemsModel>> getItemsByFolder(FolderProperties folder);
}

class FolderPageRemoteDateSource extends FolderPageBaseRemoteDateSource{
  // TODO: phone
  @override
  Future<List<FolderItemsModel>> getItemsByFolder(
      FolderProperties folder) async {
    String? phone = await readData('phone');

    DocumentSnapshot<Map<String, dynamic>> user = await FirebaseFirestore.instance
        .collection('users')
        .doc(phone)
        .get();
    List data = (user.data()!)['files'];
    Logger().f('dataaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa $data');
    List<FolderItemsModel> files = [];
    for (int i = 0; i < data.length; i++) {
      if (data[i]['type'] == folder.name) {
        files.add(FolderItemsModel.fromMap(data[i]));
      }
    }
    /*List.from((user.docs[0]['files'] as List)
        .map((item) => FolderItemsModel.fromMap(item)));*/
    return files;
  }
}