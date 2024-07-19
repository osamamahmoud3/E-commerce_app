import 'package:ecommerce/core/styles/app_styles.dart';
import 'package:ecommerce/core/styles/colors.dart';
import 'package:ecommerce/core/widgets/custom_button.dart';
import 'package:ecommerce/features/authentication/data/models/auth/phone_uath_cubit/phone_auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../../../../core/routings/routes.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../../../generated/l10n.dart';

class OptScreen extends StatelessWidget {
  OptScreen({super.key, this.phoneNuber});
  late String verificationCodee;
  final phoneNuber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: BlocListener<PhoneAuthCubit, PhoneAuthState>(
            listener: (context, state) {
              if (state is PhoneAuthError) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.error),
                ));
              } else if (state is PhoneAuthVerified) {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(
                  context,
                  Routes.changePassword,
                );
              } else if (state is PhoneAuthLoading) {
                customLoadingIndicator(context);
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 25,
                ),
                Text(S.of(context).verification_code,
                    style: AppStyles.font20Medium),
                const SizedBox(
                  height: 20,
                ),
                Text(
                    S
                        .of(context)
                        .Enter_the_verification_code_we_just_sent_you_on_your_email_address,
                    style:
                        AppStyles.font15Medium.copyWith(color: Colors.black54)),
                const SizedBox(
                  height: 35,
                ),
                OtpTextField(
                  numberOfFields: 5,
                  borderColor: AppColors.primaryColor,
                  focusedBorderColor: AppColors.primaryColor,

                  clearText: true,
                  showFieldAsBox: true,

                  onCodeChanged: (String code) {},

                  onSubmit: (String verificationCode) {
                    verificationCodee = verificationCode;
                  }, // end onSubmit
                ),
                const SizedBox(
                  height: 35,
                ),
                CustomButton(
                  text: Text(S.of(context).Resend_Code,
                      style: AppStyles.font18SemiBold
                          .copyWith(color: Colors.white)),
                  bgColor: AppColors.secondaryColor,
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 35,
                ),
                CustomButton(
                  text: Text(S.of(context).confirm,
                      style: AppStyles.font18SemiBold
                          .copyWith(color: Colors.white)),
                  bgColor: AppColors.primaryColor,
                  onPressed: () {
                    BlocProvider.of<PhoneAuthCubit>(context)
                        .submitOtp(verificationCodee);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
