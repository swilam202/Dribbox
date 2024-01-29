import 'package:dartz/dartz.dart';
import 'package:dribbox/core/error/failure.dart';
import 'package:dribbox/core/resources/folders.dart';
import 'package:dribbox/features/home%20feature/domain/entites/file%20properties.dart';
import 'package:dribbox/core/models/folder%20items.dart';
import 'package:dribbox/features/home%20feature/domain/entites/uploaded%20file%20properties.dart';

abstract class HomePageBaseRepository{
  Future<Either<Failure,FileProperties>> pickFile();
  Future<Either<Failure,UploadedFileProperties>> uploadFile(FileProperties file);
  Future<Either<Failure,List<FolderItems>>> getAllItems();
  Future<Either<Failure,String>> deleteFile(FolderItems file);
}