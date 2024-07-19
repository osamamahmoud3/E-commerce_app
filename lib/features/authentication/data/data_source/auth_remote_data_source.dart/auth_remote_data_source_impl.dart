import 'package:ecommerce/core/network/api_service.dart';
import 'package:ecommerce/features/authentication/data/data_source/auth_remote_data_source.dart/auth_remote_data_source.dart';
import 'package:ecommerce/features/authentication/data/models/auth/auth.model.dart';
import 'package:ecommerce/features/authentication/domin/entities/auth_entity.dart';

import '../../../../../core/network/authorize_user.dart';

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final ApiService apiService;

  AuthRemoteDataSourceImpl({required this.apiService});
  @override
  Future<AuthModel> signIn(String email, String password) async {
    var response = await apiService
        .post(endPoint: "login", body: {"email": email, "password": password});

    var data = AuthModel.fromJson(response);
    print(data);
  

    return data;
  }

  @override
  Future<AuthEntity> signUp(
      String name, String phoneNumber, String email, String password) async {
    var response = await apiService.post(endPoint: "register", body: {
      "name": name,
      "phone": phoneNumber,
      "email": email,
      "password": password
    });
    var data = AuthModel.fromJson(response);

    return data;
  }
}
