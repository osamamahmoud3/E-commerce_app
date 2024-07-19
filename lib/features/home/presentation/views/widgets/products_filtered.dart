import 'package:flutter/material.dart';

import '../../controller/products_cubit/products_filter/products_filter_cubit.dart';
import '../screens/product_details_screen.dart';
import 'product_item.dart';

class ProductFiltered extends StatelessWidget {
  const ProductFiltered({
    super.key,
    required this.state,
  });
  final ProductsFilterSuccess state;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 7,
            crossAxisSpacing: 14,
            mainAxisExtent: 200,
            crossAxisCount: 2),
        itemBuilder: (context, index) {
          return ProductItem(
            productId: state.productsFiletered[index].productId.toInt(),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ProductsDetailsScreen(
                  products: state.productsFiletered[index],
                );
              }));
            },
            price: state.productsFiletered[index].productPrice.toString(),
            productName: state.productsFiletered[index].productName,
            image: state.productsFiletered[index].productImage,
          );
        },
        itemCount: int.parse(state.productsFiletered.length.toString()),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics());
  }
}
