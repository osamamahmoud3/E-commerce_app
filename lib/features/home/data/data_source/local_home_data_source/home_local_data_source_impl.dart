import 'package:ecommerce/core/utils/constants.dart';
import 'package:ecommerce/features/home/data/models/banner.model.dart';

import 'package:ecommerce/features/home/data/models/products.model.dart';
import 'package:ecommerce/features/home/domin/home_entites/banner_entity.dart';

import 'package:ecommerce/features/home/domin/home_entites/category_entity.dart';
import 'package:ecommerce/features/home/domin/home_entites/product_entity.dart';
import 'package:hive/hive.dart';

import 'home_local_data_source.dart';

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  @override
  List<BannerEntity> getBanners() {
    var banners = Hive.box<BannerEntity>(bannerHiveKey);
    return banners.values.toList();
  }

  @override
  List<CategoryEntity> getCategories() {
    var categories = Hive.box<CategoryEntity>(categoryHiveKey);
    return categories.values.toList();
  }

  @override
  List<ProductEntity> getProducts() {
    var products = Hive.box<ProductEntity>(productHiveKey);
    return products.values.toList();
  }
}
