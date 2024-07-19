import '../../../domin/entities/about_entity.dart';
import '../../../domin/entities/response_entity.dart';
import '../../../domin/entities/user_data_entity.dart';

abstract class SettingsReomteDataSource {
  Future<UserDataEntity> getUserData();
  Future<AboutEntity> aboutApp();

  Future<UserDataEntity> updateUserData({
    required String image,
    required String name,
    required String email,
    required String phone,
  });

  Future<ResponseEntity> changePassword({
    required String oldPassword,
    required String newPassword,
  });
}
