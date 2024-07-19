import 'package:flutter/material.dart';

import 'category_component.dart';
import 'products.dart';
import 'products_banner.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key, required this.productGridView});
  final Widget productGridView;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ProductsBanner(),
        const SizedBox(
          height: 20,
        ),
        const CategoryComponent(),
        const SizedBox(
          height: 23,
        ),
        Products(
          productGridView: productGridView,
        )
      ],
    );
  }
}
