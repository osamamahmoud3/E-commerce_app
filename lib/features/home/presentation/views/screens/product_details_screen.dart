import 'package:flutter/material.dart';

import '../../../domin/home_entites/product_entity.dart';
import '../widgets/product_details_screen_body.dart';

class ProductsDetailsScreen extends StatelessWidget {
  const ProductsDetailsScreen({super.key, required this.products});
  final ProductEntity products;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductsDetailsScreenBody(
        products: products,
      ),
    );
  }
}
