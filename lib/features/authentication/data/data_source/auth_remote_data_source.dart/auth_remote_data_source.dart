import 'package:ecommerce/features/authentication/domin/entities/auth_entity.dart';

import '../../models/auth/auth.model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthModel> signIn(String email, String password);
  Future<AuthEntity> signUp(
      String name, String phoneNumber, String email, String password);
}
