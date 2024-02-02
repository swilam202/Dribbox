import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entites/file properties.dart';
import '../repository/home page base repository.dart';

class PickFileUseCase {
  HomePageBaseRepository homePageBaseRepository;

  PickFileUseCase(this.homePageBaseRepository);

  Future<Either<Failure, FileProperties>> execute() async {
    return await homePageBaseRepository.pickFile();
  }
}
