import 'package:ecommerce/core/network/api_service.dart';
import 'package:ecommerce/features/settings/data/data_source.dart/settings_remote_data_source/settings_remote_data_source.dart';
import 'package:ecommerce/features/settings/data/model/user.data.dart';
import 'package:ecommerce/features/settings/domin/entities/about_entity.dart';
import 'package:ecommerce/features/settings/domin/entities/response_entity.dart';
import 'package:ecommerce/features/settings/domin/entities/user_data_entity.dart';

import '../../model/about.app.dart';

class SettingsReomteDataSourceImpl extends SettingsReomteDataSource {
  final ApiService apiService;

  SettingsReomteDataSourceImpl({required this.apiService});
  @override
  Future<UserDataEntity> getUserData() async {
    var response = await apiService.get(endPoint: "profile");
    return UserModel.fromJson(response['data']);
  }

  @override
  Future<AboutEntity> aboutApp() async {
    var response = await apiService.get(endPoint: "settings");
    return AboutAppModel.fromJson(response['data']);
  }

  @override
  Future<UserDataEntity> updateUserData(
      {required String image,
      required String name,
      required String email,
      required String phone}) async {
    var response = await apiService.put(
        endPoint: 'update-profile',
        body: {"image": image, "name": name, "email": email, "phone": phone});
    return UserModel.fromJson(response['data']);
  }

  @override
  Future<ResponseEntity> changePassword(
      {required String oldPassword, required String newPassword}) async {
    var response = await apiService.post(
        endPoint: 'change-password',
        body: {"current_password": oldPassword, "new_password": newPassword});

    if (response['status'] == true) {
      return ResponseEntity(
          responseStatus: true, responseMessage: response['message']);
    } else {
      return ResponseEntity(
          responseStatus: false, responseMessage: response['message']);
    }
  }
}
