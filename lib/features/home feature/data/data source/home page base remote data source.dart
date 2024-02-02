import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../../../core/resources/folders.dart';
import '../../../../core/services/storage.dart';
import '../../../../core/utils/get file type.dart';
import '../../domain/entites/file properties.dart';
import '../model/folder items model.dart';
import '../model/uploaded file properties model.dart';

abstract class HomePageBaseRemoteDataSource {
  Future<UploadedFilePropertiesModel> uploadFile(FileProperties file);

  Future<List<FolderItemsModel>> getAllItems();

  Future<List<FolderItemsModel>> getItemsByFolder(FolderProperties folder);
}

class HomePageRemoteDataSource extends HomePageBaseRemoteDataSource {
  @override
  Future<UploadedFilePropertiesModel> uploadFile(FileProperties file) async {
    String? phone = await readData('phone');

    Reference reference =
        FirebaseStorage.instance.ref('dribbox/$phone/${file.name}');

    await reference.putFile(file.file);

    String url = await reference.getDownloadURL();

    String type = getFileType(file.name);

    DocumentReference<Map<String, dynamic>> user =
        FirebaseFirestore.instance.collection('users').doc(phone);

    DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await user.get();
    List files = (documentSnapshot.data()!)['files'];
    files.add({
      'name': file.name,
      'url': url,
      'size': file.size,
      'type': type,
    });

    await user.update({
      'files': files,
    });
    return UploadedFilePropertiesModel(file.name, type, url, file.size);
  }

  @override
  Future<List<FolderItemsModel>> getAllItems() async {
    String? phone = await readData('phone');
    DocumentSnapshot<Map<String, dynamic>> user =
        await FirebaseFirestore.instance.collection('users').doc(phone!).get();
    Map<String, dynamic> data = user.data()!;
    List<FolderItemsModel> files = List.from(
      (data['files'] as List).map(
        (item) => FolderItemsModel.fromMap(item),
      ),
    );
    return files;
  }

  @override
  Future<List<FolderItemsModel>> getItemsByFolder(
      FolderProperties folder) async {
    String? phone = await readData('phone');

    DocumentSnapshot<Map<String, dynamic>> user =
        await FirebaseFirestore.instance.collection('users').doc(phone).get();
    List data = (user.data()!)['files'];
    List<FolderItemsModel> files = [];
    for (int i = 0; i < data.length; i++) {
      if (data[i]['type'] == folder.name) {
        files.add(
          FolderItemsModel.fromMap(data[i]),
        );
      }
    }

    return files;
  }
}
