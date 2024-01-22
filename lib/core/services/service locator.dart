import 'package:dribbox/features/auth%20feature/presentation/controller/auth%20controller.dart';
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

  // sl.registerSingleton<AuthController>(AuthController());
  }
}
