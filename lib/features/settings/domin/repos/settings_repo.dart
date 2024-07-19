import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/settings/domin/entities/about_entity.dart';
import 'package:ecommerce/features/settings/domin/entities/response_entity.dart';
import 'package:ecommerce/features/settings/domin/entities/user_data_entity.dart';

import '../../../../core/network/error_handler.dart';

abstract class SettingsRepo {
  Future<Either<Failure, UserDataEntity>> getUserData();

  Future<Either<Failure, AboutEntity>> aboutApp();

  Future<Either<Failure, UserDataEntity>> updateUserData({
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
