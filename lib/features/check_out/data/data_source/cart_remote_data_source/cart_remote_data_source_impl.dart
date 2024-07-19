import 'package:ecommerce/features/check_out/data/data_source/cart_remote_data_source/cart_remote_data_source.dart';
import 'package:ecommerce/features/check_out/data/models/cart_model/cart/cart.model.dart';
import 'package:ecommerce/features/check_out/data/models/cart_model/cart/cart_item.model.dart';

import '../../../../../core/network/api_service.dart';

class CartRemoteDataSourceImpl extends CartRemoteDataSource {
  final ApiService apiService;

  CartRemoteDataSourceImpl({required this.apiService});

  @override
  Future<CartModel> getCartItems() async {
    var response = await apiService.get(endPoint: "carts");
    List<CartItem> cartItems = [];
    for (var item in response['data']['cart_items']) {
      cartItems.add(CartItem.fromJson(item));
    }
    CartModel cart = CartModel(
        subTotal: response['data']['sub_total'],
        total: response['data']['total'],
        cartItems: cartItems);

    return cart;
  }
}
