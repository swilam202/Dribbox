import 'package:dartz/dartz.dart';
import 'package:dribbox/features/folder%20feature/data/data%20source/folder%20page%20base%20data%20source.dart';
import 'package:dribbox/features/folder%20feature/domain/repository/folder%20page%20base%20repository.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/resources/folders.dart';
import '../../../../core/models/folder items.dart';

class FolderPageRepository extends FolderPageBaseRepository{
  FolderPageBaseRemoteDateSource folderPageBaseRemoteDateSource;
  FolderPageRepository(this.folderPageBaseRemoteDateSource);

  @override
  Future<Either<Failure, List<FolderItems>>> getItemsByFolder(FolderProperties folder) async{
    final List<FolderItems> model = await folderPageBaseRemoteDateSource.getItemsByFolder(folder);
    try{
      return Right(model);
    }
    catch(ex){
      return const Left(Failure('There was an error while uploading file please try again!'));
    }
  }
}