import 'package:ecommerce/features/home/domin/repos/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domin/home_entites/product_entity.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final HomeRepo homeRepo;
  ProductsCubit(this.homeRepo) : super(ProductsInitial());

  Future<void> getProducts() async {
    emit(ProductsLoading());
    var response = await homeRepo.getProducts();
    response.fold((l) {
      emit(ProductsFailure(message: l.errorMsg));
    }, (products) {
      emit(ProductsSuccess(products: products));
    });
  }
}
