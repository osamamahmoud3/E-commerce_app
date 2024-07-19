import 'package:ecommerce/features/check_out/data/models/cart_model/cart/cart.model.dart';
import 'package:ecommerce/features/check_out/domin/entities/cart_product_entity.dart';

abstract class CartRemoteDataSource {
  Future<CartModel> getCartItems();
}
