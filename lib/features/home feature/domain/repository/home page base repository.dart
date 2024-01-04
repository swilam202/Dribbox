import 'package:dartz/dartz.dart';
import 'package:dribbox/core/error/failure.dart';
import 'package:dribbox/features/home%20feature/domain/entites/file%20properties.dart';
import 'package:dribbox/features/home%20feature/domain/entites/uploaded%20file%20properties.dart';

abstract class HomePageBaseRepository{
  Future<Either<Failure,FileProperties>> pickFile();
  Future<Either<Failure,UploadedFileProperties>> uploadFile();
}