import '../resources/folders.dart';
import '../services/service locator.dart';

String getFileType(String name) {
  List sections = name.split('.');
  name = sections[sections.length - 1];
  String folderName = 'Others';
  FolderProperties folderProperties = OtherFolderProperties();
  for (int i = 0; i < sl<List<FolderProperties>>().length; i++) {
    folderProperties = sl<List<FolderProperties>>()[i];
    for (int j = 0; j < folderProperties.types.length; j++) {
      if (name == folderProperties.types[j]) {
        folderName = folderProperties.name;
        break;
      }
    }
  }

  return folderName;
}
