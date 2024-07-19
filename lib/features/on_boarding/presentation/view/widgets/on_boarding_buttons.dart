import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/routings/routes.dart';
import '../../../../../core/styles/app_styles.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../generated/l10n.dart';

class OnBoardingButtons extends StatelessWidget {
  const OnBoardingButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.signIn);
          },
          icon: SvgPicture.asset('assets/images/Login.svg'),
          bgColor: AppColors.primaryColor,
          text: Text(S.of(context).Sign_In,
              style: AppStyles.font21Bold.copyWith(color: Colors.white)),
        ),
        const SizedBox(
          height: 30,
        ),
        CustomButton(
          onPressed: () => Navigator.pushNamed(context, Routes.signUp),
          icon: SvgPicture.asset('assets/images/sigh_up_icon.svg'),
          bgColor: AppColors.secondaryColor,
          text: Text(S.of(context).Sign_Up,
              style: AppStyles.font21Bold.copyWith(color: Colors.white)),
        )
      ],
    );
  }
}
