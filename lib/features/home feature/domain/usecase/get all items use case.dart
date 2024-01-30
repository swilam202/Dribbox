import 'package:dartz/dartz.dart';
import 'package:dribbox/features/home%20feature/domain/repository/home%20page%20base%20repository.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/models/folder items.dart';
import '../../data/model/folder items.dart';

class GetAllItemsUseCase {
  HomePageBaseRepository homePageBaseRepository;

  GetAllItemsUseCase(this.homePageBaseRepository);

  Future<Either<Failure, List<FolderItems>>> execute() async {
    return await homePageBaseRepository.getAllItems();
  }
}
