import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/resources/folders.dart';
import '../../domain/entites/file properties.dart';
import '../../domain/entites/uploaded file properties.dart';
import '../../domain/repository/home page base repository.dart';
import '../data source/home page base local data source.dart';
import '../data source/home page base remote data source.dart';
import '../model/file properties model.dart';
import '../model/folder items model.dart';
import '../model/folder items.dart';
import '../model/uploaded file properties model.dart';

class HomePageRepository extends HomePageBaseRepository {
  HomePageBaseLocalDataSource homePageBaseLocalDataSource;
  HomePageBaseRemoteDataSource homePageBaseRemoteDataSource;

  HomePageRepository(
      this.homePageBaseLocalDataSource, this.homePageBaseRemoteDataSource);

  @override
  Future<Either<Failure, FilePropertiesModel>> pickFile() async {
    try {
      final FilePropertiesModel model =
          await homePageBaseLocalDataSource.pickFile();

      return Right(model);
    } on Failure catch (ex) {
      return Left(ex);
    }
  }

  @override
  Future<Either<Failure, FileProperties>> pickFolderByFile(
      FolderProperties folder) async {
    try {
      final FilePropertiesModel model =
          await homePageBaseLocalDataSource.pickFolderFile(folder);

      return Right(model);
    } on Failure catch (ex) {
      return Left(ex);
    }
  }

  @override
  Future<Either<Failure, UploadedFileProperties>> uploadFile(
      FileProperties file) async {
    try {
      final UploadedFilePropertiesModel model =
          await homePageBaseRemoteDataSource.uploadFile(file);

      return Right(model);
    } catch (ex) {
      return const Left(
          Failure('There was an error while uploading file please try again!'));
    }
  }

  @override
  Future<Either<Failure, List<FolderItems>>> getAllItems() async {
    try {
      final List<FolderItemsModel> model =
          await homePageBaseRemoteDataSource.getAllItems();

      return Right(model);
    } catch (ex) {
      return const Left(
          Failure('There was an error while uploading file please try again!'));
    }
  }

  @override
  Future<Either<Failure, List<FolderItems>>> getItemsByFolder(
      FolderProperties folder) async {
    try {
      final List<FolderItems> model =
          await homePageBaseRemoteDataSource.getItemsByFolder(folder);

      return Right(model);
    } catch (ex) {
      return const Left(
          Failure('There was an error while uploading file please try again!'));
    }
  }
}
