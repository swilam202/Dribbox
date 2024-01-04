/*
import 'dart:io';
import 'package:logger/logger.dart';
import 'package:path/path.dart';

import 'package:dribbox/core/widgets/toast.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';



Future<File?> pickFile()async{
   File file;
  FilePickerResult? filePickerResult = await FilePicker.platform.pickFiles();
  if(filePickerResult == null){
    await showToast('Something went wrong, please try again!');
  }
  else{


   file = File(filePickerResult.paths[0]!);

   return file;
  }
}

FirebaseStorage storage = FirebaseStorage.instance;

Future<String> uploadFile(File file)async{
  String name = basename(file.path);
  Reference reference = FirebaseStorage.instance.ref('dribbox/************/$name');
   await reference.putFile(file);


  String? url = await reference.getDownloadURL();
  return url;
}
*/
