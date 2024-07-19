import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/styles/app_styles.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/widgets/custom_button.dart';

class ProductDetailsButtom extends StatelessWidget {
  const ProductDetailsButtom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
              text: Text(
                "Buy Now",
                style: AppStyles.font20Medium.copyWith(color: Colors.white),
              ),
              bgColor: AppColors.primaryColor,
              onPressed: () {}),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21),
          child: SvgPicture.asset('assets/images/Bag-2.svg'),
        ),
        const Icon(
          Icons.favorite,
          color: Colors.red,
          size: 35,
        ),
      ],
    );
  }
}
