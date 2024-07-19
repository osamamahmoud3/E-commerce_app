import 'package:ecommerce/features/home/domin/home_entites/banner_entity.dart';
import 'package:ecommerce/features/home/domin/home_entites/product_entity.dart';

import '../../../domin/home_entites/category_entity.dart';

abstract class HomeLocalDataSource {
  List<CategoryEntity> getCategories();
  List<BannerEntity> getBanners();
  List<ProductEntity> getProducts();
}
