import 'package:ecommerce/features/home/domin/repos/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domin/home_entites/banner_entity.dart';

part 'banner_state.dart';

class BannerCubit extends Cubit<BannerState> {
  final HomeRepo homeRepo;
  BannerCubit(this.homeRepo) : super(BannerInitial());

  Future<void> getBanners() async {
    emit(BannerLoadibg());
    var response = await homeRepo.getBanners();
    response.fold((l) {
      emit(BannerFailure(message: l.errorMsg));
    }, (banners) {
      emit(BannerSuccess(banners: banners));
    });
  }
}
