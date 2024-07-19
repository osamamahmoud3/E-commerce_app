import 'package:bloc/bloc.dart';
import 'package:ecommerce/features/settings/domin/repos/settings_repo.dart';
import 'package:meta/meta.dart';

import '../../../domin/entities/response_entity.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final SettingsRepo settingsRepo;
  ChangePasswordCubit(this.settingsRepo) : super(ChangePasswordInitial());

  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    emit(ChangePasswordLoading());
    var response = await settingsRepo.changePassword(
        oldPassword: oldPassword, newPassword: newPassword);

    if (response.responseStatus) {
      emit(ChangePasswordSuccess(response));
    } else {
      emit(ChangePasswordFailure(response.responseMessage));
    }
  }
}
