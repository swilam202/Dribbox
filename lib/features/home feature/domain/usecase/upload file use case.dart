import 'package:dartz/dartz.dart';
import 'package:dribbox/features/home%20feature/domain/repository/home%20page%20base%20repository.dart';

import '../../../../core/error/failure.dart';
import '../entites/uploaded file properties.dart';

class UploadFileUseCase {
  HomePageBaseRepository homePageBaseRepository;

  UploadFileUseCase(this.homePageBaseRepository);

  Future<Either<Failure, UploadedFileProperties>> execute() async {
    return await homePageBaseRepository.uploadFile();
  }
}
