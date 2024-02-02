import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entites/section.dart';
import '../../domain/repository/storage details base repository.dart';
import '../data source/storage details base remote data source.dart';

class StorageDetailsRepository extends StorageDetailsBaseRepository {
  StorageDetailsBaseRemoteDataSource storageDetailsBaseRemoteDataSource;

  StorageDetailsRepository(this.storageDetailsBaseRemoteDataSource);

  @override
  Future<Either<Failure, List<Section>>> getStorageDetails() async {
    try {
      final List<Section> response =
          await storageDetailsBaseRemoteDataSource.getStorageDetails();
      return Right(response);
    } catch (ex) {
      return Left(Failure(
          'There was an error while getting storage details please try again!'));
    }
  }
}
