import 'package:dartz/dartz.dart';
import 'package:dribbox/core/resources/folders.dart';

import '../../../../core/error/failure.dart';
import '../entites/file properties.dart';
import '../entites/uploaded file properties.dart';
import '../repository/home page base repository.dart';

class PickFileByFolderUseCase {
  HomePageBaseRepository homePageBaseRepository;

  PickFileByFolderUseCase(this.homePageBaseRepository);

  Future<Either<Failure, FileProperties>> execute(FolderProperties folder) async {
    return await homePageBaseRepository.pickFolderByFile(folder);
  }
}