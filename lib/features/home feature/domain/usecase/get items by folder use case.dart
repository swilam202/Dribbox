import 'package:dartz/dartz.dart';
import 'package:dribbox/core/resources/folders.dart';
import 'package:dribbox/features/home%20feature/domain/repository/home%20page%20base%20repository.dart';

import '../../../../core/error/failure.dart';
import '../entites/folder items.dart';

class GetItemsByFolderUseCase{
  HomePageBaseRepository homePageBaseRepository;
  GetItemsByFolderUseCase(this.homePageBaseRepository);
  Future<Either<Failure,List<FolderItems>>> execute(FolderProperties folder)async{
    return await homePageBaseRepository.getItemsByFolder(folder);
  }
}