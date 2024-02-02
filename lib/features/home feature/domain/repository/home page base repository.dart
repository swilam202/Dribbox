import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/resources/folders.dart';
import '../../data/model/folder items.dart';
import '../entites/file properties.dart';
import '../entites/uploaded file properties.dart';

abstract class HomePageBaseRepository {
  Future<Either<Failure, FileProperties>> pickFile();

  Future<Either<Failure, FileProperties>> pickFolderByFile(
      FolderProperties folder);

  Future<Either<Failure, UploadedFileProperties>> uploadFile(
      FileProperties file);

  Future<Either<Failure, List<FolderItems>>> getAllItems();

  Future<Either<Failure, List<FolderItems>>> getItemsByFolder(
      FolderProperties folder);
}
