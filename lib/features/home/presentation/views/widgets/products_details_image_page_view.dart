import 'package:flutter/material.dart';

import '../../../domin/home_entites/product_entity.dart';
import 'product_details_image.dart';

class ProductsDetailsImagePageView extends StatelessWidget {
  const ProductsDetailsImagePageView(
      {super.key, required this.products, this.controller});
  final ProductEntity products;
  final PageController? controller;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
        allowImplicitScrolling: true,
        controller: controller,
        onPageChanged: (value) {
          controller!.animateToPage(value,
              duration: const Duration(microseconds: 15), curve: Curves.linear);
        },
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        itemCount: products.productMoreImages.length,
        itemBuilder: (context, index) {
          return ProductsDetailsImage(
            image: products.productMoreImages[index],
            products: products,
          );
        });
  }
}
