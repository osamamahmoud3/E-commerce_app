import 'package:ecommerce/features/settings/domin/entities/user_data_entity.dart';

class UserModel extends UserDataEntity {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  num? points;
  num? credit;
  String? token;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.image,
    this.points,
    this.credit,
    this.token,
  }) : super(
            userToken: token ?? '',
            userName: name ?? '',
            userEmail: email ?? '',
            userPhone: phone ?? '',
            userImage: image ?? '',
            userId: id.toString());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        phone: json['phone'] as String?,
        image: json['image'] as String?,
        points: json['points'] as num?,
        credit: json['credit'] as num?,
        token: json['token'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'image': image,
        'points': points,
        'credit': credit,
        'token': token,
      };
}
