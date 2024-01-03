import 'dart:io';

import 'package:dribbox/core/widgets/toast.dart';
import 'package:file_picker/file_picker.dart';


class FileProperties{
  final String name;
  final String extension;
  final num size;

  FileProperties(this.name, this.extension, this.size);
}

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
