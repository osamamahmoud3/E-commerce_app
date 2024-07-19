import 'package:ecommerce/features/settings/domin/entities/about_entity.dart';

class AboutAppModel extends AboutEntity {
  String? about;
  String? terms;

  AboutAppModel({this.about, this.terms}) : super(aboutApp: about ?? '');

  factory AboutAppModel.fromJson(Map<String, dynamic> json) => AboutAppModel(
        about: json['about'] as String?,
        terms: json['terms'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'about': about,
        'terms': terms,
      };
}
