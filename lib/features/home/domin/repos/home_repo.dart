import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/network/error_handler.dart';

import '../home_entites/banner_entity.dart';
import '../home_entites/category_entity.dart';
import '../home_entites/product_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
  Future<Either<Failure, List<BannerEntity>>> getBanners();
  Future<Either<Failure, List<ProductEntity>>> getProducts();
  Future<Either<Failure, List<ProductEntity>>> getFavourite();
  Future<Either<Failure, Set<int>>> addAndRemoveFavourite(int id);
  List<ProductEntity> filterProducts({required String input});
}
