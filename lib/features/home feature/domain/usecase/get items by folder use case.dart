import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/resources/folders.dart';
import '../../data/model/folder items.dart';
import '../repository/home page base repository.dart';

class GetItemsByFolderUseCase {
  HomePageBaseRepository homePageBaseRepository;

  GetItemsByFolderUseCase(this.homePageBaseRepository);

  Future<Either<Failure, List<FolderItems>>> execute(
      FolderProperties folder) async {
    return await homePageBaseRepository.getItemsByFolder(folder);
  }
}
