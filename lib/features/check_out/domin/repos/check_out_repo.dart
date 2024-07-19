import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/network/error_handler.dart';
import 'package:ecommerce/features/check_out/domin/entities/cart_product_entity.dart';

import '../../data/models/cart_model/cart/cart.model.dart';

abstract class CheckOutRepo {
  Future<Either<Failure, CartModel>> getCartProduct();
}
