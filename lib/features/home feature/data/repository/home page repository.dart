import 'package:dartz/dartz.dart';
import 'package:dribbox/core/error/failure.dart';
import 'package:dribbox/features/home%20feature/data/data%20source/home%20page%20base%20local%20data%20source.dart';
import 'package:dribbox/features/home%20feature/domain/entites/file%20properties.dart';
import 'package:dribbox/features/home%20feature/domain/repository/home%20page%20base%20repository.dart';

import '../model/file properties model.dart';

class HomePageRepository extends HomePageBaseRepository{
  HomePageBaseLocalDataSource homePageBaseLocalDataSource;
  HomePageRepository(this.homePageBaseLocalDataSource);

  @override
  Future<Either<Failure, FileProperties>> pickFile() async{
    final FilePropertiesModel response = await homePageBaseLocalDataSource.pickFile();
    try{
      return Right(response);
    }
    on Failure catch(ex){
      return Left(ex);
    }
  }

}