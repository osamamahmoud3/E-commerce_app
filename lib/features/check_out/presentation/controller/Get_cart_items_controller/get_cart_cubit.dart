import 'package:ecommerce/features/check_out/data/models/cart_model/cart/cart.model.dart';
import 'package:ecommerce/features/check_out/domin/repos/check_out_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domin/entities/cart_product_entity.dart';

part 'get_cart_state.dart';

class GetCartCubit extends Cubit<GetCartState> {
  final CheckOutRepo checkOutRepo;
  GetCartCubit(this.checkOutRepo) : super(GetCartInitial());

  Future<void> getCartItems() async {
    emit(GetCartLoading());
    var data = await checkOutRepo.getCartProduct();
    await data.fold((l) async {
      emit(GetCartFailure(errorMsg: l.errorMsg));
    }, (r) async {
      emit(GetCartSuccess(cartItems: r));
    });
  }
}
