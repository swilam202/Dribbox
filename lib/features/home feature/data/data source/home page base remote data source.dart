import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dribbox/core/utils/get%20file%20type.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../domain/entites/file properties.dart';
import '../model/folder items model.dart';
import '../model/uploaded file properties model.dart';

abstract class HomePageBaseRemoteDataSource {
  Future<UploadedFilePropertiesModel> uploadFile(FileProperties file);
  Future<List<FolderItemsModel>> getAllItems();
}

class HomePageRemoteDataSource extends HomePageBaseRemoteDataSource {
  @override
  Future<UploadedFilePropertiesModel> uploadFile(FileProperties file) async {
    // TODO: phone
    Reference reference =
        FirebaseStorage.instance.ref('dribbox/55555/${file.name}');
    await reference.putFile(file.file);
    String url = await reference.getDownloadURL();
    String type = getFileType(file.name);
    return UploadedFilePropertiesModel(file.name, type, url, file.size);
  }

  // TODO: phone
  @override
  Future<List<FolderItemsModel>> getAllItems() async {
    QuerySnapshot<Map<String, dynamic>> user = await FirebaseFirestore.instance
        .collection('users')
        .where('phone', isEqualTo: '55555')
        .get();
    List<FolderItemsModel> files = List.from((user.docs[0]['files'] as List)
        .map((item) => FolderItemsModel.fromMap(item)));
    return files;
  }


}
