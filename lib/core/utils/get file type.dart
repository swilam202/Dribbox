import 'package:dribbox/core/resources/folders.dart';

import '../services/service locator.dart';

String getFileType(String name) {
  FolderProperties folderProperties;
  String? folderName;
  for (int i = 0; i < sl<List<FolderProperties>>().length; i++) {
    folderProperties = sl<List<FolderProperties>>()[i];
    for (int j = 0; j < folderProperties.types.length; i++) {
      if (name == folderProperties.types[j]) {
        folderName = folderProperties.name;
        break;
      }
    }
  }
  if (folderName == null) {
    folderProperties = OtherFolderProperties();
    return folderProperties.name;
  } else {
    return folderName;
  }
}
