import 'package:dartz/dartz.dart';
import 'package:dribbox/features/home%20feature/domain/repository/home%20page%20base%20repository.dart';

import '../../../../core/error/failure.dart';
import '../entites/file properties.dart';

class PickFileUseCase {
  HomePageBaseRepository homePageBaseRepository;

  PickFileUseCase(this.homePageBaseRepository);

  Future<Either<Failure, FileProperties>> execute() async {
    return await homePageBaseRepository.pickFile();
  }
}
