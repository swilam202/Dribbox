import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/resources/folders.dart';
import '../../../../core/models/folder items.dart';

abstract class FolderPageBaseRepository{
  Future<Either<Failure,List<FolderItems>>> getItemsByFolder(FolderProperties folder);
}