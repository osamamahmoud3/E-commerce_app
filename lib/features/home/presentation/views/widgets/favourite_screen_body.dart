import 'package:ecommerce/features/home/presentation/controller/favourite_product_cubit/add_and_remove_from_favourite/add_and_remove_from_favourite_cubit.dart';
import 'package:ecommerce/features/home/presentation/controller/favourite_product_cubit/favourite_product_cubit.dart';
import 'package:ecommerce/features/home/presentation/views/screens/home_screen.dart';
import 'package:ecommerce/features/home/presentation/views/widgets/favourite_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/styles/app_styles.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../generated/l10n.dart';

class FavouriteScreenBody extends StatefulWidget {
  const FavouriteScreenBody({super.key});

  @override
  State<FavouriteScreenBody> createState() => _FavouriteScreenBodyState();
}

class _FavouriteScreenBodyState extends State<FavouriteScreenBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteProductCubit, FavouriteProductState>(
      builder: (context, state) {
        if (state is FavouriteProductFailure) {
          return Center(
            child: Text(state.errorMsg),
          );
        } else if (state is FavouriteProductSuccess) {
          numberOfFavouritesItems = state.favourites.length;
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    S.of(context).Favourites,
                    style: AppStyles.font21Bold,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  state.favourites.isEmpty
                      ? Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.sizeOf(context).height * 0.25),
                          child: Center(
                            child: Lottie.asset(
                              'assets/animate_images/favourite.json',
                              height: 150,
                              width: 150,
                            ),
                          ),
                        )
                      : ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.favourites.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Slidable(
                              key: Key(
                                  state.favourites[index].productId.toString()),
                              endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) async {
                                      await BlocProvider.of<
                                                  AddAndRemoveFromFavouriteCubit>(
                                              listen: false, context)
                                          .addAndRemoveFavourite(state
                                              .favourites[index].productId
                                              .toInt());
                                      Future.delayed(
                                          const Duration(microseconds: 300),
                                          () {
                                        BlocProvider.of<FavouriteProductCubit>(
                                                context)
                                            .getFavourites();
                                      });
                                    },
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                    label: 'Delete',
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: FavouriteItem(
                                  onTap: () {
                                    setState(() async {
                                      await BlocProvider.of<
                                                  AddAndRemoveFromFavouriteCubit>(
                                              context)
                                          .addAndRemoveFavourite(state
                                              .favourites[index].productId
                                              .toInt());
                                      await BlocProvider.of<
                                              FavouriteProductCubit>(context)
                                          .getFavourites();
                                    });
                                  },
                                  productName:
                                      state.favourites[index].productName,
                                  price: state.favourites[index].productPrice
                                      .toString(),
                                  image: state.favourites[index].productImage,
                                ),
                              ),
                            );
                          })
                ],
              ),
            ),
          );
        } else {
          return Center(
            child: Container(
                height: MediaQuery.sizeOf(context).height * 0.09,
                width: MediaQuery.sizeOf(context).width * 0.2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                    child: CircularProgressIndicator(
                  color: AppColors.secondaryColor,
                ))),
          );
        }
      },
    );
  }
}
