import 'dart:io';

import 'package:dribbox/core/error/failure.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:logger/logger.dart';

import '../model/file properties model.dart';
import '../model/uploaded file properties model.dart';

abstract class HomePageBaseLocalDataSource {
  Future<FilePropertiesModel> pickFile();
}

class HomePageLocalDataSource extends HomePageBaseLocalDataSource {
  @override
  Future<FilePropertiesModel> pickFile() async {
    FilePickerResult? filePickerResult = await FilePicker.platform.pickFiles();

    if (filePickerResult != null) {
      File file = File(filePickerResult.paths[0]!);
      String name = filePickerResult.names[0]!;
      List<String> split = name.split('.');
      String extension = split[split.length - 1];
      int size = file.lengthSync();

      Logger().t(size);

      return FilePropertiesModel(file, name, extension, size);
    } else {
      throw const Failure('Something went wrong, please try again!');
    }
  }
}
