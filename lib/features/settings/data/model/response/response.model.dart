import 'package:collection/collection.dart';
import 'package:ecommerce/features/settings/domin/entities/response_entity.dart';

import 'data.model.dart';

class Response extends ResponseEntity {
  bool? status;
  String? message;
  Data? data;

  Response({this.status, this.message, this.data})
      : super(responseStatus: status ?? false, responseMessage: message ?? "");

  factory Response.fromJson(Map<String, dynamic> json) => Response(
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

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Response) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ data.hashCode;
}
