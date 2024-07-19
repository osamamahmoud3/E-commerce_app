import 'package:ecommerce/features/home/domin/repos/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domin/home_entites/product_entity.dart';

part 'favourite_product_state.dart';

class FavouriteProductCubit extends Cubit<FavouriteProductState> {
  final HomeRepo homeRepo;
  FavouriteProductCubit(this.homeRepo) : super(FavouriteProductInitial());

  Future<void> getFavourites() async {
    emit(FavouriteProductLoading());
    var result = await homeRepo.getFavourite();
    result.fold((l) {
      emit(FavouriteProductFailure(errorMsg: l.errorMsg));
    }, (r) {
      emit(FavouriteProductSuccess(favourites: r));
    });
  }
}
