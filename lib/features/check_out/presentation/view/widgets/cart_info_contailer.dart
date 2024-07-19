import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/styles/app_styles.dart';

class CartInfoContainer extends StatelessWidget {
  const CartInfoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 80),
        height: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white),
        child: const CartINfoListTile());
  }
}

class CartINfoListTile extends StatelessWidget {
  const CartINfoListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset("assets/images/cart_kind.svg"),
      title: const Text(
        "Credit Card",
        style: AppStyles.font18regular,
      ),
      subtitle: const Text(
        "Mastercard **78",
        style: AppStyles.font16regular,
      ),
    );
  }
}
