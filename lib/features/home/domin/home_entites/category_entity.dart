import 'package:hive/hive.dart';

part 'category_entity.g.dart';

@HiveType(typeId: 1)
class CategoryEntity {
  @HiveField(0)
  final int categoryId;

  @HiveField(1)
  final String categoryName;

  @HiveField(2)
  final String categoryImage;
  CategoryEntity(
      {required this.categoryId,
      required this.categoryName,
      required this.categoryImage});
}
