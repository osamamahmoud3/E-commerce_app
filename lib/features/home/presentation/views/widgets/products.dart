import 'package:ecommerce/core/styles/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';

class Products extends StatelessWidget {
  const Products({super.key, required this.productGridView});
  final Widget productGridView;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).Products,
          style: AppStyles.font18Blod,
        ),
        const SizedBox(
          height: 11,
        ),
        productGridView
      ],
    );
  }
}
