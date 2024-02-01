import 'package:dartz/dartz.dart';

import 'package:dribbox/core/error/failure.dart';
import 'package:dribbox/features/storage%20details/data/data%20source/storage%20details%20base%20remote%20data%20source.dart';

import 'package:dribbox/features/storage%20details/domain/entites/section.dart';

import '../../domain/repository/storage details base repository.dart';

class StorageDetailsRepository extends StorageDetailsBaseRepository{
  StorageDetailsBaseRemoteDataSource storageDetailsBaseRemoteDataSource;
  StorageDetailsRepository(this.storageDetailsBaseRemoteDataSource);
  @override
  Future<Either<Failure, List<Section>>> getStorageDetails() async{
   try{
     final List<Section> response = await storageDetailsBaseRemoteDataSource.getStorageDetails();
      return Right(response);
   }
    catch(ex){
      return Left(Failure('There was an error while getting storage details please try again!'));
    }
  }

}