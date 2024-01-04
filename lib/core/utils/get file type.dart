import '../resources/folders.dart';
import '../services/service locator.dart';

String getFileType(String name) {
  FolderProperties folderProperties = OtherFolderProperties();
  String folderName = folderProperties.name;
  for (int i = 0; i < sl<List<FolderProperties>>().length; i++) {
    folderProperties = sl<List<FolderProperties>>()[i];
    for (int j = 0; j < folderProperties.types.length; i++) {
      if (name == folderProperties.types[j]) {
        folderName = folderProperties.name;
        break;
      }
    }
  }

  return folderName;
}
