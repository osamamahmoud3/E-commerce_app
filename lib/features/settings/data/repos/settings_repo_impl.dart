import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/core/network/error_handler.dart';
import 'package:ecommerce/features/settings/data/data_source.dart/settings_remote_data_source/settings_remote_data_source.dart';
import 'package:ecommerce/features/settings/domin/entities/about_entity.dart';
import 'package:ecommerce/features/settings/domin/entities/response_entity.dart';
import 'package:ecommerce/features/settings/domin/entities/user_data_entity.dart';

import '../../domin/repos/settings_repo.dart';

class SettingsRepoimpl extends SettingsRepo {
  final SettingsReomteDataSource settingsReomteDataSource;
  SettingsRepoimpl({required this.settingsReomteDataSource});
  @override
  Future<Either<Failure, UserDataEntity>> getUserData() async {
    try {
      var response = await settingsReomteDataSource.getUserData();
      return Right(response);
    } on DioException catch (e) {
      return Left(ServerFailure.formDioException(e));
    } catch (e) {
      return Left(ServerFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AboutEntity>> aboutApp() async {
    try {
      var response = await settingsReomteDataSource.aboutApp();
      return Right(response);
    } on DioException catch (e) {
      return Left(ServerFailure.formDioException(e));
    } catch (e) {
      return Left(ServerFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserDataEntity>> updateUserData(
      {required String image,
      required String name,
      required String email,
      required String phone}) async {
    try {
      var response = await settingsReomteDataSource.updateUserData(
          image: image, name: name, email: email, phone: phone);

      return Right(response);
    } on DioException catch (e) {
      return Left(ServerFailure.formDioException(e));
    } catch (e) {
      return Left(ServerFailure(errorMsg: e.toString()));
    }
  }

  @override
  Future<ResponseEntity> changePassword(
      {required String oldPassword, required String newPassword}) async {
    var response = await settingsReomteDataSource.changePassword(
        oldPassword: oldPassword, newPassword: newPassword);

    return response;
  }
}
