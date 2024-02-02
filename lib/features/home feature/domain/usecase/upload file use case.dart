import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entites/file properties.dart';
import '../entites/uploaded file properties.dart';
import '../repository/home page base repository.dart';

class UploadFileUseCase {
  HomePageBaseRepository homePageBaseRepository;

  UploadFileUseCase(this.homePageBaseRepository);

  Future<Either<Failure, UploadedFileProperties>> execute(
      FileProperties file) async {
    return await homePageBaseRepository.uploadFile(file);
  }
}
