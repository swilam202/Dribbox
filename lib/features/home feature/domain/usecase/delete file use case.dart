
import 'package:dartz/dartz.dart';
import 'package:dribbox/core/models/folder%20items.dart';

import '../../../../core/error/failure.dart';
import '../repository/home page base repository.dart';

class DeleteFileUseCase {
  HomePageBaseRepository homePageBaseRepository;
  DeleteFileUseCase(this.homePageBaseRepository);

  Future<Either<Failure, void>> execute(FolderItems file) async {
    return await homePageBaseRepository.deleteFile(file);
  }
}