import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dribbox/core/resources/folders.dart';
import 'package:dribbox/core/utils/get%20file%20type.dart';
import 'package:dribbox/features/home%20feature/data/model/folder%20items%20model.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../domain/entites/file properties.dart';
import '../model/file properties model.dart';
import '../model/uploaded file properties model.dart';

abstract class HomePageBaseRemoteDataSource {
  Future<UploadedFilePropertiesModel> uploadFile(FileProperties file);

  Future<List<FolderItemsModel>> getItemsByFolder(FolderProperties folder);

  Future<List<FolderItemsModel>> getAllItems();
}

class HomePageRemoteDataSource extends HomePageBaseRemoteDataSource {
  @override
  Future<UploadedFilePropertiesModel> uploadFile(FileProperties file) async {
    // TODO: phone
    Reference reference =
        FirebaseStorage.instance.ref('dribbox/************/${file.name}');
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
        .where('phone', isEqualTo: '*************')
        .get();
    List<FolderItemsModel> files = List.from((user.docs[0]['files'] as List)
        .map((item) => FolderItemsModel.fromMap(item)));
    return files;
  }

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
