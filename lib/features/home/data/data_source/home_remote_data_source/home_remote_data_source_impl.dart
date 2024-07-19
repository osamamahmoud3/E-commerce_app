import 'package:ecommerce/features/home/domin/home_entites/banner_entity.dart';
import 'package:ecommerce/features/home/domin/home_entites/category_entity.dart';
import 'package:ecommerce/features/home/domin/home_entites/product_entity.dart';
import 'package:hive/hive.dart';

import '../../../../../core/network/api_service.dart';
import '../../../../../core/utils/constants.dart';
import '../../../presentation/views/screens/home_screen.dart';
import 'home_remote_data_source.dart';
import 'mapping_banner_response.dart';
import 'mapping_category_reposnse.dart';
import 'mapping_favourite_products.dart';
import 'mapping_products_response.dart';

Set<int> favouriteIds = {};

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService apiService;
  HomeRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<BannerEntity>> getBanners() async {
    var response = await apiService.get(endPoint: "banners");
    List<BannerEntity> banners = mappingBannerResponse(response);
    addBannersToLoaclDataSource(banners);
    return banners;
  }

  void addBannersToLoaclDataSource(List<BannerEntity> banners) {
    Hive.box<BannerEntity>(bannerHiveKey).addAll(banners);
  }

  @override
  Future<List<CategoryEntity>> getCategories() async {
    var response = await apiService.get(endPoint: "categories");
    List<CategoryEntity> categories = mappingCategoryReposnse(response);
    addCaregoryToLocalDataSource(categories);
    return categories;
  }

  void addCaregoryToLocalDataSource(List<CategoryEntity> categories) {
    Hive.box<CategoryEntity>(categoryHiveKey).addAll(categories);
  }

  List<ProductEntity> products = [];
  @override
  Future<List<ProductEntity>> getProducts() async {
    var response = await apiService.get(endPoint: "products");
    products = mappingProductsResponse(response);
    addProductsToLocalDataSource();
    return products;
  }

  void addProductsToLocalDataSource() {
    Hive.box<ProductEntity>(productHiveKey).addAll(products);
  }

  @override
  List<ProductEntity> filterProducts({required String input}) {
    List<ProductEntity> productsFiltered = [];

    if (products.isEmpty) {
      products = Hive.box<ProductEntity>(productHiveKey).values.toList();
    }
    productsFiltered = products
        .where((element) =>
            element.productName.toLowerCase().startsWith(input.toLowerCase()))
        .toList();

    return productsFiltered;
  }

  List<ProductEntity> favourites = [];

  @override
  Future<List<ProductEntity>> getFavourite() async {
    favourites.clear();
    var response = await apiService.get(endPoint: "favorites");

    favourites = mappingFavouriteProducts(response, favouriteIds);
    numberOfFavouritesItems = favourites.length;
    return favourites;
  }

  @override
  Future<Set<int>> addAndRemoveFavourite(int id) async {
    var response = await apiService
        .post(endPoint: 'favorites', body: {"product_id": '$id'});
    if (response['status'] == true) {
      if (favouriteIds.contains(id)) {
        favouriteIds.remove(id);
        numberOfFavouritesItems = favourites.length;
      } else {
        favouriteIds.add(id);
        numberOfFavouritesItems = favourites.length;
      }
    }
    await getFavourite();
    return favouriteIds;
  }
}
