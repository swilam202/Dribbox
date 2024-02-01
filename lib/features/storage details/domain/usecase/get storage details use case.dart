import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entites/section.dart';
import '../repository/storage details base repository.dart';

class GetStorageDetailsUseCase{
  StorageDetailsBaseRepository storageDetailsBaseRepository;
  GetStorageDetailsUseCase(this.storageDetailsBaseRepository);
  Future<Either<Failure,List<Section>>> execute(){
    return storageDetailsBaseRepository.getStorageDetails();
  }
}