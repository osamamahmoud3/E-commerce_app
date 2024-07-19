import '../../domin/home_entites/category_entity.dart';

class Categories extends CategoryEntity {
  int? id;
  String? name;
  String? image;

  Categories({this.id, this.name, this.image})
      : super(categoryId: id!, categoryName: name!, categoryImage: image!);

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        id: json['id'] as int?,
        name: json['name'] as String?,
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
      };
}
