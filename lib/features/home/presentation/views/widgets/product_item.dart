import 'package:ecommerce/features/home/presentation/controller/favourite_product_cubit/add_and_remove_from_favourite/add_and_remove_from_favourite_cubit.dart';
import 'package:ecommerce/features/home/presentation/views/screens/home_screen.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:text_scroll/text_scroll.dart';

import '../../../../../core/styles/app_styles.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/data_source/home_remote_data_source/home_remote_data_source_impl.dart';
import '../../controller/favourite_product_cubit/favourite_product_cubit.dart';

class ProductItem extends StatefulWidget {
  const ProductItem(
      {super.key,
      required this.image,
      required this.productName,
      required this.price,
      this.onTap,
      required this.productId});
  final String image;
  final String productName;
  final String price;

  final int productId;
  final void Function()? onTap;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AddAndRemoveFromFavouriteCubit,
          AddAndRemoveFromFavouriteState>(
        listener: (context, state) {
          if (state is AddAndRemoveFromFavouriteFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.errorMsg),
            ));
          } else if (state is AddAndRemoveFromFavouriteLoading) {
          } else if (state is AddAndRemoveFromFavouriteSuccess) {
            numberOfFavouritesItems = state.favouritesId.length;
          }
        },
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.primaryColor),
            child: GestureDetector(
              onTap: widget.onTap,
              child: Container(
                height: 200,
                margin: const EdgeInsets.all(1.2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      height: 135,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FancyShimmerImage(
                          height: 140,
                          width: double.infinity,
                          boxDecoration: BoxDecoration(
                            color: Colors.white60,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          boxFit: BoxFit.scaleDown,
                          imageUrl: widget.image,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 1,
                    ),
                    SizedBox(
                      width: 140,
                      child: TextScroll(
                        widget.productName,
                        mode: TextScrollMode.endless,
                        velocity:
                            const Velocity(pixelsPerSecond: Offset(10, 0)),
                        delayBefore: const Duration(seconds: 2),
                        numberOfReps: 1000,
                        pauseBetween: const Duration(milliseconds: 900),
                        style: AppStyles.font13Medium
                            .copyWith(color: Colors.black),
                        textAlign: TextAlign.right,
                        selectable: true,
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    SizedBox(
                      width: 140,
                      child: Row(
                        children: [
                          Text(
                            widget.price + S.of(context).EGP,
                            style: AppStyles.font13Medium
                                .copyWith(color: AppColors.secondaryColor),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () async {
                              await BlocProvider.of<
                                      AddAndRemoveFromFavouriteCubit>(context)
                                  .addAndRemoveFavourite(widget.productId);
                              await BlocProvider.of<FavouriteProductCubit>(
                                      context)
                                  .getFavourites();
                            },
                            child: Icon(Icons.favorite,
                                color: favouriteIds.contains(widget.productId)
                                    ? Colors.red
                                    : Colors.grey,
                                size: 20),
                          ),
                        ],
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
