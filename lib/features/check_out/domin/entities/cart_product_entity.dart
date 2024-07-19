class CartProductEntity {
  final String massageOfResponse;
  final bool statusMassage;
  final int productId;
  final num productPrice;
  final String productName;
  final String productImage;

  CartProductEntity(
      {required this.massageOfResponse,
      required this.statusMassage,
      required this.productId,
      required this.productPrice,
      required this.productName,
      required this.productImage});
}
