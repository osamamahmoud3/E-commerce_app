import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/network/error_handler.dart';
import 'package:ecommerce/features/authentication/domin/entities/auth_entity.dart';

import '../../data/models/auth/auth.model.dart';

abstract class AuthRepo {
  Future<Either<Failure, AuthModel>> signIn(String email, String password);
  Future<Either<Failure, AuthEntity>> signUp(
      String name, String phoneNumber, String email, String password);
}
