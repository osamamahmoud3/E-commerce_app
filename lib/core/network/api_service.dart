import 'package:dio/dio.dart';
import 'package:ecommerce/core/network/authorize_user.dart';

import '../../kutuku_app.dart';

class ApiService {
  final String baseUrl = "https://student.valuxapps.com/api/";
  final Dio _dio;

  ApiService({required Dio dio}) : _dio = dio;
  Future<Map<String, dynamic>> post(
      {required String endPoint, required Map<String, dynamic> body}) async {
    var response = await _dio.post("$baseUrl$endPoint",
        queryParameters: body,
        options: Options(headers: {'lang': lag, 'Authorization': token!}));
    return response.data;
  }

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get(
      "$baseUrl$endPoint",
      options: Options(
        headers: {'lang': lag, 'Authorization': token!},
      ),
    );

    return response.data;
  }

  Future<Map<String, dynamic>> put(
      {required String endPoint, required Map<String, dynamic> body}) async {
    var response = await _dio.put("$baseUrl$endPoint",
        queryParameters: body,
        options: Options(headers: {'lang': lag, 'Authorization': token!}));
    print(response.data);
    return response.data;
  }
}
