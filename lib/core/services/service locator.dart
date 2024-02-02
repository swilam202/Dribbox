import 'package:get_it/get_it.dart';

import '../../features/home feature/data/data source/home page base local data source.dart';
import '../../features/home feature/data/data source/home page base remote data source.dart';
import '../../features/home feature/data/repository/home page repository.dart';
import '../../features/home feature/domain/repository/home page base repository.dart';
import '../../features/home feature/domain/usecase/get all items use case.dart';
import '../../features/home feature/domain/usecase/get items by folder use case.dart';
import '../../features/home feature/domain/usecase/pick file by folder use case.dart';
import '../../features/home feature/domain/usecase/pick file use case.dart';
import '../../features/home feature/domain/usecase/upload file use case.dart';
import '../../features/storage details/data/data source/storage details base remote data source.dart';
import '../../features/storage details/data/repository/storage details repository.dart';
import '../../features/storage details/domain/repository/storage details base repository.dart';
import '../../features/storage details/domain/usecase/get storage details use case.dart';
import '../resources/folders.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static void setup() {
    ///folders
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

    ///HomePage
    sl.registerLazySingleton<HomePageBaseLocalDataSource>(
        () => HomePageLocalDataSource());
    sl.registerLazySingleton<HomePageBaseRemoteDataSource>(
        () => HomePageRemoteDataSource());
    sl.registerLazySingleton<HomePageBaseRepository>(
        () => HomePageRepository(sl(), sl()));
    //use cases
    sl.registerLazySingleton<GetAllItemsUseCase>(
        () => GetAllItemsUseCase(sl()));
    sl.registerLazySingleton<UploadFileUseCase>(() => UploadFileUseCase(sl()));
    sl.registerLazySingleton<PickFileUseCase>(() => PickFileUseCase(sl()));
    sl.registerLazySingleton<PickFileByFolderUseCase>(
        () => PickFileByFolderUseCase(sl()));
    sl.registerLazySingleton<GetItemsByFolderUseCase>(
        () => GetItemsByFolderUseCase(sl()));

    ///StorageDetailsPage
    sl.registerLazySingleton<StorageDetailsBaseRemoteDataSource>(
        () => StorageDetailsRemoteDataSource());
    sl.registerLazySingleton<StorageDetailsBaseRepository>(
        () => StorageDetailsRepository(sl()));
    //use cases
    sl.registerLazySingleton<GetStorageDetailsUseCase>(
        () => GetStorageDetailsUseCase(sl()));
  }
}
