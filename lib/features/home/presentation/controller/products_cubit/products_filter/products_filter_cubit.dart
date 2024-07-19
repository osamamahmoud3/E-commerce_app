import 'package:ecommerce/features/home/domin/repos/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domin/home_entites/product_entity.dart';
part 'products_filter_state.dart';

class ProductsFilterCubit extends Cubit<ProductsFilterState> {
  final HomeRepo homeRepo;
  ProductsFilterCubit(this.homeRepo) : super(ProductsFilterInitial());

  void filterProducts({required String input}) {
    emit(ProductsFilterLoading());
    var response = homeRepo.filterProducts(input: input);
    response.isNotEmpty
        ? emit(ProductsFilterSuccess(productsFiletered: response))
        : emit(ProductsFilterFailure(message: "No products found"));
  }
}
