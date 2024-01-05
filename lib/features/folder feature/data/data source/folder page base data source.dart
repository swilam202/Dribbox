import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/resources/folders.dart';
import '../model/folder items model.dart';

abstract class FolderPageBaseRemoteDateSource{
  Future<List<FolderItemsModel>> getItemsByFolder(FolderProperties folder);
}

class FolderPageRemoteDateSource extends FolderPageBaseRemoteDateSource{
  // TODO: phone
  @override
  Future<List<FolderItemsModel>> getItemsByFolder(
      FolderProperties folder) async {
    QuerySnapshot<Map<String, dynamic>> user = await FirebaseFirestore.instance
        .collection('users')
        .where('phone', isEqualTo: '*************')
        .get();
    List<FolderItemsModel> files = [];
    for (int i = 0; i < (user.docs[0]['files']).length; i++) {
      if (user.docs[0]['files'][i]['type'] == folder.name) {
        files.add(FolderItemsModel.fromMap(user.docs[0]['files'][i]));
      }
    }
    List.from((user.docs[0]['files'] as List)
        .map((item) => FolderItemsModel.fromMap(item)));
    return files;
  }
}