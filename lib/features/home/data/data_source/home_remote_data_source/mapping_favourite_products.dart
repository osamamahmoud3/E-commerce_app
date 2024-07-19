import '../../../domin/home_entites/product_entity.dart';
import '../../models/products.model.dart';

List<ProductEntity> mappingFavouriteProducts(
    Map<String, dynamic> response, Set<int> favouriteIds) {
  List<ProductEntity> favourites = [];
  for (var favItem in response['data']['data']) {
    favourites.add(ProductsModel.fromJson(favItem['product']));
    favouriteIds.add(favItem['product']['id']);
  }
  return favourites;
}
