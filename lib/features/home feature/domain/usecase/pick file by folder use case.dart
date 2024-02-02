import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/resources/folders.dart';
import '../entites/file properties.dart';
import '../repository/home page base repository.dart';

class PickFileByFolderUseCase {
  HomePageBaseRepository homePageBaseRepository;

  PickFileByFolderUseCase(this.homePageBaseRepository);

  Future<Either<Failure, FileProperties>> execute(
      FolderProperties folder) async {
    return await homePageBaseRepository.pickFolderByFile(folder);
  }
}
