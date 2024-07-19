import 'package:collection/collection.dart';

class Data {
  String? email;

  Data({this.email});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        email: json['email'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'email': email,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Data) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => email.hashCode;
}
