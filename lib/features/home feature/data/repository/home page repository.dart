import 'package:dartz/dartz.dart';
import 'package:dribbox/core/error/failure.dart';
import 'package:dribbox/features/home%20feature/data/data%20source/home%20page%20base%20local%20data%20source.dart';
import 'package:dribbox/features/home%20feature/data/model/uploaded%20file%20properties%20model.dart';
import 'package:dribbox/features/home%20feature/domain/entites/file%20properties.dart';
import 'package:dribbox/core/models/folder%20items.dart';
import 'package:dribbox/features/home%20feature/domain/entites/uploaded%20file%20properties.dart';
import 'package:dribbox/features/home%20feature/domain/repository/home%20page%20base%20repository.dart';

import '../data source/home page base remote data source.dart';
import '../model/file properties model.dart';
import '../model/folder items model.dart';

class HomePageRepository extends HomePageBaseRepository{
  HomePageBaseLocalDataSource homePageBaseLocalDataSource;
  HomePageBaseRemoteDataSource homePageBaseRemoteDataSource;
  HomePageRepository(this.homePageBaseLocalDataSource,this.homePageBaseRemoteDataSource);

  @override
  Future<Either<Failure, FilePropertiesModel>> pickFile() async{
    final FilePropertiesModel model = await homePageBaseLocalDataSource.pickFile();
    try{
      return Right(model);
    }
    on Failure catch(ex){
      return Left(ex);
    }
  }

  @override
  Future<Either<Failure, UploadedFileProperties>> uploadFile(FileProperties file) async{
    final UploadedFilePropertiesModel model = await homePageBaseRemoteDataSource.uploadFile(file);
    try{
      return Right(model);
    }
    catch(ex){
      return const Left(Failure('There was an error while uploading file please try again!'));
    }
  }

  @override
  Future<Either<Failure, List<FolderItems>>> getAllItems() async{
    final List<FolderItemsModel> model = await homePageBaseRemoteDataSource.getAllItems();
    try{
      return Right(model);
    }
    catch(ex){
      return const Left(Failure('There was an error while uploading file please try again!'));
    }
  }

  @override
  Future<Either<Failure, String>> deleteFile(FolderItems file) async{
     var model =  await homePageBaseRemoteDataSource.deleteFile(file);
    try{
      return const Right('File deleted successfully');
    }
    catch(ex){
      return const Left(Failure('There was an error while uploading file please try again!'));
    }
  }



}