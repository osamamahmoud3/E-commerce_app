import 'package:ecommerce/features/home/presentation/views/screens/product_details_screen.dart';
import 'package:ecommerce/features/home/presentation/views/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/products_cubit/products_cubit.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 7,
                  crossAxisSpacing: 14,
                  mainAxisExtent: 205,
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return ProductItem(
                  productId: state.products[index].productId.toInt(),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ProductsDetailsScreen(
                        products: state.products[index],
                      );
                    }));
                  },
                  price: state.products[index].productPrice.toString(),
                  productName: state.products[index].productName,
                  image: state.products[index].productImage,
                );
              },
              itemCount: state.products.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics());
        } else if (state is ProductsFailure) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
