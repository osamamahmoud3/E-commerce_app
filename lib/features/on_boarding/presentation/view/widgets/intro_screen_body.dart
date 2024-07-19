import 'package:ecommerce/core/styles/app_styles.dart';
import 'package:ecommerce/core/styles/colors.dart';
import 'package:ecommerce/features/on_boarding/presentation/view/screens/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import 'package:intro_screen_onboarding_flutter/introscreenonboarding.dart';

import '../../../../../core/language_cubit/language_cubit.dart';
import '../../../../../generated/l10n.dart';

class IntroScreenBody extends StatelessWidget {
  const IntroScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          IntroScreenOnboarding(
            introductionList: [
              Introduction(
                titleTextStyle: AppStyles.font15Regular
                    .copyWith(color: AppColors.primaryColor),
                subTitleTextStyle: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade500,
                ),
                title: S.of(context).Buy_Products,
                subTitle: S
                    .of(context)
                    .Browse_the_menu_and_order_directly_from_the_application,
                imageUrl: 'assets/images/onboarding1.jpg',
              ),
              Introduction(
                titleTextStyle: AppStyles.font15Regular
                    .copyWith(color: AppColors.primaryColor),
                subTitleTextStyle: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade500,
                ),
                title: S.of(context).delivery,
                subTitle: S
                    .of(context)
                    .Your_order_will_be_immediately_collected_and_delivered,
                imageUrl: 'assets/images/onbaording2.jpg',
              ),
              Introduction(
                titleTextStyle: AppStyles.font15Regular
                    .copyWith(color: AppColors.primaryColor),
                subTitleTextStyle: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade500,
                ),
                title: S.of(context).Receive_Money,
                subTitle: S
                    .of(context)
                    .Pick_up_delivery_at_your_door_and_enjoy_groceries,
                imageUrl: 'assets/images/onboarding3.jpg',
              ),
            ],
            skipTextStyle: AppStyles.font14SemiBold.copyWith(
              color: AppColors.primaryColor,
            ),
            foregroundColor: AppColors.primaryColor,
            onTapSkipButton: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OnBoardingScreen(),
                ), //MaterialPageRoute
              );
            },
            // foregroundColor: Colors.red,
          ),
          Positioned(
            top: 20,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: DropdownButton(
                  iconEnabledColor: AppColors.primaryColor,
                  icon: const Icon(Icons.language),
                  value: context.watch<LanguageCubitCubit>().state.languageCode,
                  underline: const SizedBox(),
                  style: AppStyles.font14SemiBold
                      .copyWith(color: AppColors.primaryColor, fontSize: 18),
                  dropdownColor: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  items: const [
                    DropdownMenuItem(
                      value: 'en',
                      child: Text('English'),
                    ),
                    DropdownMenuItem(
                      value: 'ar',
                      child: Text('عربي'),
                    ),
                  ],
                  onChanged: (value) {
                    if (value == 'en') {
                      BlocProvider.of<LanguageCubitCubit>(context)
                          .changeLangEn(context);
                    } else if (value == 'ar') {
                      BlocProvider.of<LanguageCubitCubit>(context)
                          .changeLangAr(context);
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
