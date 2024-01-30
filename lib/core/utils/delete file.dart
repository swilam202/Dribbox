import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dribbox/core/models/folder%20items.dart';
import 'package:dribbox/core/widgets/custom%20toast.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../features/home feature/data/model/folder items.dart';
import '../services/storage.dart';
import 'toast status.dart';

Future<void> deleteFileFunction(FolderItems file) async {
  String? phone = await readData('phone');
  Reference reference =
      FirebaseStorage.instance.ref('dribbox/$phone/${file.name}');
  try {
    await reference.delete();
    DocumentReference<Map<String, dynamic>> user =
        FirebaseFirestore.instance.collection('users').doc(phone);

    DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await user.get();
    List files = (documentSnapshot.data()!)['files'];
    files.removeWhere((element) => element['name'] == file.name);

     await user.set({
      'files': files,
    });
    await customToast('File deleted successfully', ToastStatus.success);
  } catch (ex) {
    await customToast(
        'There was an error while deleting file please try again!',
        ToastStatus.error);
  }
}
