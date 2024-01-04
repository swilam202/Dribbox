import 'package:get_it/get_it.dart';

import '../resources/folders.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static void setup() {
    sl.registerSingleton<List<FolderProperties>>([
      APKFolderProperties(),
      ProgrammingFolderProperties(),
      FilesFolderProperties(),
      AudioFolderProperties(),
      VideosFolderProperties(),
      ImagesFolderProperties(),
      ArchiveFolderProperties(),
      OtherFolderProperties(),
    ]);
  }
}
