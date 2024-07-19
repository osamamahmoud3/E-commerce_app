import 'package:ecommerce/core/styles/app_styles.dart';
import 'package:ecommerce/core/widgets/custom_loading_indicator.dart';
import 'package:ecommerce/features/authentication/data/models/auth/phone_uath_cubit/phone_auth_cubit.dart';
import 'package:ecommerce/features/authentication/presentation/view/widgets/auth_header.dart';
import 'package:ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/routings/routes.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'text_feild_component.dart';

class ForgotPasswordScreenBody extends StatelessWidget {
  ForgotPasswordScreenBody({super.key});

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: BlocListener<PhoneAuthCubit, PhoneAuthState>(
          listener: (context, state) {
            if (state is PhoneAuthError) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.error),
              ));
            } else if (state is PhoneAuthSubmitted) {
              Navigator.pop(context);
              Navigator.pushNamed(context, Routes.otp,
                  arguments: emailController.text);
            } else if (state is PhoneAuthLoading) {
              customLoadingIndicator(context);
            } else if (state is PhoneAuthError) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.error),
              ));
            }
          },
          child: Column(
            children: [
              AuthHeader(
                  tilte: S.of(context).Forgot_Password,
                  subTitile: S.of(context).Enter_Your_Pssword),
              const SizedBox(
                height: 25,
              ),
              TextFieldComponent(
                icon: SvgPicture.asset(
                  'assets/images/Login.svg',
                  color: AppColors.primaryColor,
                ),
                hint: S.of(context).Enter_Your_Email,
                title: S.of(context).Email,
                controller: emailController,
                // validator: (value) {
                //   if (value!.isEmpty) {
                //     return S.of(context).email_is_Required;
                //   } else if (!value.contains("@")) {
                //     return S.of(context).Enter_Correct_Email_like;
                //   }
                //   return null;
                // },
              ),
              const SizedBox(
                height: 25,
              ),
              CustomButton(
                bgColor: AppColors.primaryColor,
                text: Text(
                  S.of(context).Send_Email,
                  style: AppStyles.font18SemiBold.copyWith(color: Colors.white),
                ),
                onPressed: () {
                  if (emailController.text.isEmpty) {
                    return;
                  }

                  BlocProvider.of<PhoneAuthCubit>(context)
                      .submmitedPhoneNumber(phoneNumber: emailController.text);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
