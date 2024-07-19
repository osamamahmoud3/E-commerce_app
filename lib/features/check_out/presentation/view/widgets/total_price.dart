import 'package:flutter/material.dart';

import '../../../../../core/styles/app_styles.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key, required this.price});
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Total',
          style: AppStyles.font24Semibold,
        ),
        const Expanded(child: SizedBox()),
        Text(price, style: AppStyles.font24Semibold),
      ],
    );
  }
}
