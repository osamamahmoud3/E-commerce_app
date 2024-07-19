import '../../../domin/home_entites/banner_entity.dart';
import '../../../domin/home_entites/category_entity.dart';
import '../../../domin/home_entites/product_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<CategoryEntity>> getCategories();
  Future<List<BannerEntity>> getBanners();
  Future<List<ProductEntity>> getProducts();

  Future<List<ProductEntity>> getFavourite();

  Future<Set<int>> addAndRemoveFavourite(int id);

  List<ProductEntity> filterProducts({required String input});
}
