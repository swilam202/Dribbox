import '../../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../entites/section.dart';
abstract class StorageDetailsBaseRepository{
  Future<Either<Failure,List<Section>>> getStorageDetails();
}