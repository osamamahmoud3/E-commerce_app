import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();
  Future<Response> post(
      {required String url,
      required Map<String, dynamic> data,
      String? contentType,
      required String token}) async {
    return await _dio.post(url,
        data: data,
        options: Options(
            contentType: contentType,
            headers: {'Authorization': 'Bearer $token'}));
  }
}
