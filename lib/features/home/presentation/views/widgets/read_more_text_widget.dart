import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../../core/styles/app_styles.dart';
import '../../../../../core/styles/colors.dart';
import 'product_description.dart';

class ReadMoreTextWidget extends StatelessWidget {
  const ReadMoreTextWidget({
    super.key,
    required this.widget,
  });

  final Description widget;

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      widget.products.productDescription,
      style: AppStyles.font15Medium.copyWith(color: const Color(0Xff979797)),
      trimLines: 2,
      colorClickableText: Colors.pink,
      trimMode: TrimMode.Line,
      trimCollapsedText: 'Show more',
      trimExpandedText: 'Show less',
      moreStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppColors.secondaryColor),
    );
  }
}
