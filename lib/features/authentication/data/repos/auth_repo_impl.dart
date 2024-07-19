import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/core/network/error_handler.dart';
import 'package:ecommerce/features/authentication/data/data_source/auth_remote_data_source.dart/auth_remote_data_source.dart';
import 'package:ecommerce/features/authentication/domin/entities/auth_entity.dart';
import 'package:ecommerce/features/authentication/domin/repo/auth_repo.dart';

import '../../../../core/network/authorize_user.dart';
import '../models/auth/auth.model.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthRemoteDataSource remoteDataSource;
  AuthRepoImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, AuthModel>> signIn(
      String email, String password) async {
    try {
      var data = await remoteDataSource.signIn(email, password);
      if (data.statuss == true && data.data != null) {
        await CacheNetwork.insertToCache(
            key: 'token', value: data.data!.token.toString());
        token = CacheNetwork.getFromCache(key: 'token');
        return Right(data);
      }
      return left(Failure(errorMsg: data.responsemessage));
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.formDioException(e));
      }
      return left(ServerFailure(errorMsg: "Something went wrong"));
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> signUp(
      String name, String phoneNumber, String email, String password) async {
    try {
      var data =
          await remoteDataSource.signUp(name, phoneNumber, email, password);
      if (data.statuss == true) {
        return Right(data);
      }
      return left(Failure(errorMsg: data.responsemessage));
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.formDioException(e));
      }
      return left(ServerFailure(errorMsg: "Something went wrong"));
    }
  }
}
