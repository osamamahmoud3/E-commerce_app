import 'package:hive/hive.dart';
part 'product_entity.g.dart';

@HiveType(typeId: 0)
class ProductEntity {
  @HiveField(0)
  final num productId;
  @HiveField(1)
  final String productName;
  @HiveField(2)
  final String productImage;
  @HiveField(3)
  final num productPrice;
  @HiveField(4)
  final String productDescription;
  @HiveField(5)
  final num productOldPrice;
  @HiveField(6)
  final List<dynamic> productMoreImages;

  ProductEntity(
      {required this.productId,
      required this.productName,
      required this.productImage,
      required this.productPrice,
      required this.productDescription,
      required this.productOldPrice,
      required this.productMoreImages});
}
