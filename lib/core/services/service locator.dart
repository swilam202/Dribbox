import 'package:dribbox/features/auth%20feature/presentation/controller/auth%20controller.dart';
import 'package:dribbox/features/home%20feature/data/data%20source/home%20page%20base%20remote%20data%20source.dart';
import 'package:dribbox/features/home%20feature/domain/repository/home%20page%20base%20repository.dart';
import 'package:dribbox/features/home%20feature/domain/usecase/get%20all%20items%20use%20case.dart';
import 'package:dribbox/features/home%20feature/domain/usecase/pick%20file%20use%20case.dart';
import 'package:get_it/get_it.dart';

import '../../features/home feature/data/data source/home page base local data source.dart';
import '../../features/home feature/data/repository/home page repository.dart';
import '../../features/home feature/domain/usecase/upload file use case.dart';
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

    //HomePage
    sl.registerLazySingleton<HomePageBaseLocalDataSource>(() => HomePageLocalDataSource());
    sl.registerLazySingleton<HomePageBaseRemoteDataSource>(() => HomePageRemoteDataSource());
    sl.registerLazySingleton<HomePageBaseRepository>(() => HomePageRepository(sl(), sl()));
    sl.registerLazySingleton<GetAllItemsUseCase>(() => GetAllItemsUseCase(sl()));
    sl.registerLazySingleton<UploadFileUseCase>(() => UploadFileUseCase(sl()));
    sl.registerLazySingleton<PickFileUseCase>(() => PickFileUseCase(sl()));

  }
}
