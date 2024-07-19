import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domin/entities/user_data_entity.dart';
import '../../../domin/repos/settings_repo.dart';

part 'updata_user_data_state.dart';

class UpdataUserDataCubit extends Cubit<UpdataUserDataState> {
  final SettingsRepo settingsRepo;
  UpdataUserDataCubit(this.settingsRepo) : super(UpdataUserDataInitial());

  Future<void> updateUserData(
      {required String image,
      required String name,
      required String email,
      required String phone}) async {
    emit(UpdataUserDataLoading());
    var result = await settingsRepo.updateUserData(
        image: image, name: name, email: email, phone: phone);
    result.fold((failure) {
      emit(UpdataUserDataFailure(errorMsg: 'there is an error'));
    }, (userData) {
      emit(UpdataUserDataSuccess(userDataEntity: userData));
    });
  }
}
