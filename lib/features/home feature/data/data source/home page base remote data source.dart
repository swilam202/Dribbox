import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dribbox/core/utils/get%20file%20type.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:logger/logger.dart';

import '../../../../core/services/storage.dart';
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

    String? phone = await readData('phone');

    Reference reference = FirebaseStorage.instance.ref('dribbox/$phone/${file.name}');
    Logger().f('refffffffffffffffffffffffffffffffffffffffffffff ${reference}');

    var res = await reference.putFile(file.file);
    Logger().f('puttttttttttttt ${file.file}');
    Logger().f('resssssssssss ${res}');
    Logger().f('resssssssssss ${res.state}');
    String url = await reference.getDownloadURL();
    String type = getFileType(file.name);
    Logger().f('urlllllllllllll $url');
    Logger().f('typeeeeeeeeeeeee $type');
    DocumentReference<Map<String, dynamic>> user = FirebaseFirestore.instance.collection('users').doc(phone);

    DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await user.get();
    List files = (documentSnapshot.data()!)['files'];
    Logger().f('files $files');
files.add({
      'name': file.name,
      'url': url,
      'size': file.size,
      'type': type,
    });
    Logger().f('after files $files');

    await user.set({
      'files': files,
    });
    return UploadedFilePropertiesModel(file.name, type, url, file.size);
  }

  updateFirestoreUser()async{

  }

  @override
  Future<List<FolderItemsModel>> getAllItems() async {
    String? phone = await readData('phone');
    DocumentSnapshot<Map<String, dynamic>>  user = await FirebaseFirestore.instance
        .collection('users')
        .doc(phone!)
        .get();
    Map<String,dynamic> data = user.data()!;
    List<FolderItemsModel> files = List.from((data['files'] as List)
        .map((item) => FolderItemsModel.fromMap(item)));
    Logger().wtf('files $files');
    return files;
  }


}
