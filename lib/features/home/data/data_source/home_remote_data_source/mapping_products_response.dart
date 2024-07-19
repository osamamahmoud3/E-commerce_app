import '../../../domin/home_entites/product_entity.dart';
import '../../models/products.model.dart';

List<ProductEntity> mappingProductsResponse(Map<String, dynamic> response) {
  List<ProductEntity> products = [];
  for (var product in response['data']['data']) {
    products.add(ProductsModel.fromJson(product));
  }
  return products;
}
