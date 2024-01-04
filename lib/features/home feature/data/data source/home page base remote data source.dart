import 'package:dribbox/core/utils/get%20file%20type.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../domain/entites/file properties.dart';
import '../model/file properties model.dart';
import '../model/uploaded file properties model.dart';

abstract class HomePageBaseRemoteDataSource {
  Future<UploadedFilePropertiesModel> uploadFile(FileProperties file);
}

class HomePageRemoteDataSource extends HomePageBaseRemoteDataSource {
  @override
  Future<UploadedFilePropertiesModel> uploadFile(
      FileProperties file) async {
    Reference reference =
        FirebaseStorage.instance.ref('dribbox/************/${file.name}');
    await reference.putFile(file.file);
    String url = await reference.getDownloadURL();
    String type = getFileType(file.name);
    return UploadedFilePropertiesModel(file.name, type, url, file.size);
  }
}
