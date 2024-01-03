import 'package:dartz/dartz.dart';
import 'package:dribbox/core/error/failure.dart';
import 'package:dribbox/features/home%20feature/domain/entites/file%20properties.dart';

abstract class HomePageBaseRepository{
  Future<Either<Failure,FileProperties>> pickFile();
}