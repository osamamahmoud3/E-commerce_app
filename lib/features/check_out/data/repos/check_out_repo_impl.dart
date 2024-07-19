import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/core/network/error_handler.dart';
import 'package:ecommerce/features/check_out/data/data_source/cart_remote_data_source/cart_remote_data_source.dart';
import 'package:ecommerce/features/check_out/data/models/cart_model/cart/cart.model.dart';
import 'package:ecommerce/features/check_out/domin/entities/cart_product_entity.dart';

import '../../domin/repos/check_out_repo.dart';

class CheckOUtRepoImpl extends CheckOutRepo {
  final CartRemoteDataSource cartRemoteDataSource;

  CheckOUtRepoImpl({required this.cartRemoteDataSource});
  @override
  Future<Either<Failure, CartModel>> getCartProduct() async {
    try {
      var data = await cartRemoteDataSource.getCartItems();
      return Right(data);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.formDioException(e));
      }
      return Left(ServerFailure(errorMsg: "Something went wrong"));
    }
  }
}
