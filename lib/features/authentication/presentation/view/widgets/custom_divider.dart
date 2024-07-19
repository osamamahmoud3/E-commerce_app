import 'package:ecommerce/core/styles/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../core/styles/colors.dart';
import '../../../../../generated/l10n.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            endIndent: 23,
            color: AppColors.grey,
          ),
        ),
        Text(
          S.of(context).or,
          style: AppStyles.font17Medium.copyWith(color: Colors.black54),
        ),
        const Expanded(
          child: Divider(
            indent: 23,
            color: AppColors.grey,
          ),
        ),
      ],
    );
  }
}
