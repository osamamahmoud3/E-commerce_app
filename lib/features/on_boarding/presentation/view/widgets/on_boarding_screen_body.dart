import 'package:ecommerce/features/on_boarding/presentation/view/widgets/on_boarding_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingScreenBody extends StatelessWidget {
  const OnBoardingScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(
              child: SizedBox(),
            ),
            SvgPicture.asset(
              'assets/images/app_logo.svg',
              fit: BoxFit.scaleDown,
            ),
            const SizedBox(
              height: 10,
            ),
            SvgPicture.asset(
              'assets/images/app_name.svg',
              fit: BoxFit.scaleDown,
            ),
            const Expanded(
              child: SizedBox(),
            ),
            Image.asset('assets/images/on_boarding_image.png'),
            const Expanded(
              child: SizedBox(),
            ),
            const OnBoardingButtons(),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
