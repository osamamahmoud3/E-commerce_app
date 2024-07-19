import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/core/network/error_handler.dart';
import 'package:ecommerce/features/home/data/data_source/home_remote_data_source/home_remote_data_source.dart';
import 'package:ecommerce/features/home/domin/home_entites/banner_entity.dart';
import 'package:ecommerce/features/home/domin/home_entites/category_entity.dart';
import 'package:ecommerce/features/home/domin/home_entites/product_entity.dart';
import 'package:ecommerce/features/home/domin/repos/home_repo.dart';

import '../data_source/local_home_data_source/home_local_data_source.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl({
    required this.homeRemoteDataSource,
    required this.homeLocalDataSource,
  });
  @override
  Future<Either<Failure, List<BannerEntity>>> getBanners() async {
    try {
      var localBanners = homeLocalDataSource.getBanners();
      if (localBanners.isNotEmpty) {
        return Right(localBanners);
      }
      var response = await homeRemoteDataSource.getBanners();
      return Right(response);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.formDioException(e));
      }
      return Left(ServerFailure(errorMsg: "Something went wrong"));
    }
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      var localCategories = homeLocalDataSource.getCategories();
      if (localCategories.isNotEmpty) {
        return Right(localCategories);
      }
      var response = await homeRemoteDataSource.getCategories();
      return Right(response);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.formDioException(e));
      }
      return Left(ServerFailure(errorMsg: "Something went wrong"));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var localProducts = homeLocalDataSource.getProducts();
      if (localProducts.isNotEmpty) {
        return Right(localProducts);
      }
      var response = await homeRemoteDataSource.getProducts();
      return Right(response);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.formDioException(e));
      }
      return Left(ServerFailure(errorMsg: "Something went wrong"));
    }
  }

  @override
  List<ProductEntity> filterProducts({required String input}) {
    try {
      List<ProductEntity> data =
          homeRemoteDataSource.filterProducts(input: input);
      return data;
    } catch (e) {
      return List.empty();
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getFavourite() async {
    try {
      var response = await homeRemoteDataSource.getFavourite();
      return Right(response);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.formDioException(e));
      }
      return Left(ServerFailure(errorMsg: "Something went wrong"));
    }
  }

  @override
  Future<Either<Failure, Set<int>>> addAndRemoveFavourite(int id) async {
    try {
      var response = await homeRemoteDataSource.addAndRemoveFavourite(id);
      return Right(response);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.formDioException(e));
      }
      return Left(ServerFailure(errorMsg: "Something went wrong"));
    }
  }
}
