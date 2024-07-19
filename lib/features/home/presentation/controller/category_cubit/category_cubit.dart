import 'package:ecommerce/features/home/domin/repos/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domin/home_entites/category_entity.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryCubitState> {
  final HomeRepo homeRepo;
  CategoryCubit(this.homeRepo) : super(CategoryCubitInitial());

  Future<void> getCategories() async {
    emit(CategoryCubitLoading());
    var response = await homeRepo.getCategories();
    response.fold((l) {
      emit(CategoryCubitFailure(message: l.errorMsg));
    }, (categories) {
      emit(CategoryCubitSucess(categories: categories));
    });
  }
}
