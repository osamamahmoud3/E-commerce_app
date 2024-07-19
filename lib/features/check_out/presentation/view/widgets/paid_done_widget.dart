
import 'package:flutter/material.dart';

import '../../../../../core/styles/app_styles.dart';
import '../../../../../core/styles/colors.dart';

class PaidDone extends StatelessWidget {
  const PaidDone({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
      height: 60,

      decoration: BoxDecoration(
          border: Border.all(
            width: 1.5,
            color: AppColors.green,
          ),
          borderRadius: BorderRadius.circular(15)),

      child: Container(
          decoration: BoxDecoration(
              color: const Color(0XFFEDEDED),
              borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: Text(
              'PAID',
              style: AppStyles.font24Semibold.copyWith(color: Colors.green),
            ),
          )),
    );
  }
}
