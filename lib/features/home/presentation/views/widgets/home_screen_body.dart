import 'package:ecommerce/features/home/presentation/controller/products_cubit/products_filter/products_filter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import 'home_body.dart';
import 'home_header.dart';
import 'products_filtered.dart';
import 'products_grid_view.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 17,
          right: 17,
          top: 17,
        ),
        child: BlocBuilder<ProductsFilterCubit, ProductsFilterState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  HomeHeader(
                    textFieldOnChanged: (input) {
                      BlocProvider.of<ProductsFilterCubit>(context)
                          .filterProducts(input: input);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  state is ProductsFilterFailure
                      ? Center(
                          child: Lottie.asset(
                              'assets/animate_images/product_not_found.json'))
                      : HomeBody(
                          productGridView: state is ProductsFilterSuccess &&
                                  state.productsFiletered.isNotEmpty
                              ? ProductFiltered(
                                  state: state,
                                )
                              : const ProductGridView())
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
