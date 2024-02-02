import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../data/model/folder items.dart';
import '../repository/home page base repository.dart';

class GetAllItemsUseCase {
  HomePageBaseRepository homePageBaseRepository;

  GetAllItemsUseCase(this.homePageBaseRepository);

  Future<Either<Failure, List<FolderItems>>> execute() async {
    return await homePageBaseRepository.getAllItems();
  }
}
