import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dribbox/features/storage%20details/data/model/section%20model.dart';

import '../../../../core/resources/folders.dart';
import '../../../../core/services/service locator.dart';
import '../../../../core/services/storage.dart';

abstract class StorageDetailsBaseRemoteDataSource{
  Future<List<SectionModel>> getStorageDetails();
}

class StorageDetailsRemoteDataSource extends StorageDetailsBaseRemoteDataSource{
  @override
  Future<List<SectionModel>> getStorageDetails() async{
    String? phone = await readData('phone');
    List<SectionModel> sections = [];
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await FirebaseFirestore.instance.collection('users').doc(phone).get();
    List files = (documentSnapshot.data()!)['files'];

    for(int i=0;i<sl<List<FolderProperties>>().length;i++){
      FolderProperties folder = sl<List<FolderProperties>>()[i];
      num size = 0;
      for(int j=0;j<files.length;j++){
        if(files[j]['type']==folder.name){
          size += files[j]['size'];
        }

      }
      sections.add(SectionModel(folder.name, size, folder.color));
    }

    return sections;

  }
}
