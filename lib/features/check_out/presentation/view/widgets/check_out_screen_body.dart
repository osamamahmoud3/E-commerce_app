import 'package:ecommerce/features/check_out/presentation/controller/Get_cart_items_controller/get_cart_cubit.dart';
import 'package:ecommerce/features/check_out/presentation/view/widgets/my_shopping_bag_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/styles/app_styles.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../generated/l10n.dart';
import 'shopping_bag_priceing.dart';

class CkeckOutScreenBody extends StatelessWidget {
  const CkeckOutScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: BlocBuilder<GetCartCubit, GetCartState>(
          builder: (context, state) {
            if (state is GetCartSuccess) {
              return Stack(
                children: [
                  ListView(
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        S.of(context).My_Shopping_Bag,
                        style: AppStyles.font21Bold,
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.cartItems.cartItems?.length ?? 0,
                          itemBuilder: (context, index) {
                            return MyShoppingBagItem(
                              image: state.cartItems.cartItems?[index].product
                                      ?.image ??
                                  '',
                              name: state.cartItems.cartItems?[index].product
                                      ?.name ??
                                  '',
                              price: state.cartItems.cartItems?[index].product!
                                      .price
                                      .toString() ??
                                  ' ',
                            );
                          }),
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: ShoppingBagPriceing(
                      totLPrice:
                          S.of(context).EGP + state.cartItems.total.toString(),
                    ),
                  ),
                ],
              );
            } else if (state is GetCartFailure) {
              return Center(child: Text(state.errorMsg));
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
        ),
      ),
    );
  }
}
