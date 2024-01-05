import 'package:dartz/dartz.dart';
import 'package:dribbox/core/resources/folders.dart';
import 'package:dribbox/features/home%20feature/domain/repository/home%20page%20base%20repository.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/models/folder items.dart';
import '../repository/folder page base repository.dart';

class GetItemsByFolderUseCase{
  FolderPageBaseRepository folderPageBaseRepository;
  GetItemsByFolderUseCase(this.folderPageBaseRepository);
  Future<Either<Failure,List<FolderItems>>> execute(FolderProperties folder)async{
    return await folderPageBaseRepository.getItemsByFolder(folder);
  }
}