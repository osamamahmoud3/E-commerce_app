import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_page_indictor.dart';
import '../../../domin/home_entites/product_entity.dart';
import 'custom_products_details_arrow_back.dart';
import 'product_details_body.dart';
import 'product_details_buttom.dart';
import 'products_details_image_page_view.dart';

class ProductsDetailsScreenBody extends StatefulWidget {
  const ProductsDetailsScreenBody({super.key, required this.products});
  final ProductEntity products;

  @override
  State<ProductsDetailsScreenBody> createState() =>
      _ProductsDetailsScreenBodyState();
}

class _ProductsDetailsScreenBodyState extends State<ProductsDetailsScreenBody> {
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),
            SliverToBoxAdapter(
              child: Stack(alignment: Alignment.bottomCenter, children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.33,
                  child: ProductsDetailsImagePageView(
                    controller: controller,
                    products: widget.products,
                  ),
                ),
                const Positioned(
                  top: 20,
                  left: 20,
                  child: CustomProductsDetailsArrowBack(),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: CustomPageIndicator(
                    controller: controller,
                    count: widget.products.productMoreImages.length,
                  ),
                )
              ]),
            ),
            SliverToBoxAdapter(
                child: ProductsDetailsBody(
              products: widget.products,
            )),
            const SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  Expanded(
                    child: SizedBox(),
                  ),
                  ProductDetailsButtom(),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
