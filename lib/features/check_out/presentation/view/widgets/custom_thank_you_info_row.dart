

import 'package:flutter/material.dart';

import '../../../../../core/styles/app_styles.dart';

class CustomThankYouInfoRow extends StatelessWidget {
  const CustomThankYouInfoRow(
      {super.key, required this.thankYouInfoName, required this.date});
  final String thankYouInfoName, date;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          thankYouInfoName,
          style: AppStyles.font18regular,
        ),
        const Expanded(child: SizedBox()),
        Text(
          date,
          style: AppStyles.font18semibold,
        ),
      ],
    );
  }
}