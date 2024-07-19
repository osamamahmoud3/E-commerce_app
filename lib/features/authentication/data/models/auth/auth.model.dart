import 'package:ecommerce/features/authentication/domin/entities/auth_entity.dart';

import 'data.model.dart';

class AuthModel extends AuthEntity {
  bool? status;
  String? message;
  Data? data;

  AuthModel({this.status, this.message, this.data})
      : super(
            token: data?.token ?? '',
            name: data?.name ?? '',
            phoneNumber: data?.phone ?? '',
            email: data?.email ?? "",
            statuss: status!,
            responsemessage: message!);

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        status: json['status'] as bool?,
        message: json['message'] as String?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };
}
