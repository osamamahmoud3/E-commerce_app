

import 'package:flutter/material.dart';

import '../../../../../core/styles/app_styles.dart';

class PriceingRow extends StatelessWidget {
  const PriceingRow({super.key, required this.title, required this.price});
  final String title, price;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: AppStyles.font18regular,
        ),
        const Expanded(child: SizedBox()),
        Text(price, style: AppStyles.font18regular)
      ],
    );
  }
}
