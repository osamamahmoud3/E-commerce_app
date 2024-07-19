import 'package:ecommerce/features/settings/domin/repos/settings_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domin/entities/user_data_entity.dart';

part 'user_info_state.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  final SettingsRepo settingsRepo;
  UserInfoCubit(this.settingsRepo) : super(UserInfoInitial());

  Future<void> getUserData() async {
    emit(UserInfoLaoding());
    var result = await settingsRepo.getUserData();
    await result.fold((l) async {
      emit(UserInfoFailure(errorMsg: l.errorMsg));
    }, (r) async {
      emit(UserInfoSuccess(userDataEntity: r));
    });
  }
}
