import 'dart:io';

import 'package:file_picker/file_picker.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/resources/folders.dart';
import '../model/file properties model.dart';

abstract class HomePageBaseLocalDataSource {
  Future<FilePropertiesModel> pickFile();

  Future<FilePropertiesModel> pickFolderFile(FolderProperties folder);
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

      return FilePropertiesModel(file, name, extension, size);
    } else {
      throw const Failure('Something went wrong, please try again!');
    }
  }

  @override
  Future<FilePropertiesModel> pickFolderFile(FolderProperties folder) async {
    FilePickerResult? filePickerResult = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: folder.types);

    if (filePickerResult != null) {
      File file = File(filePickerResult.paths[0]!);
      String name = filePickerResult.names[0]!;
      List<String> split = name.split('.');
      String extension = split[split.length - 1];
      int size = file.lengthSync();

      return FilePropertiesModel(file, name, extension, size);
    } else {
      throw const Failure('Something went wrong, please try again!');
    }
  }
}
