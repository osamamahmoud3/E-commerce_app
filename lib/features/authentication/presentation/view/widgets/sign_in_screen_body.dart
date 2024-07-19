import 'package:animate_do/animate_do.dart';
import 'package:ecommerce/core/routings/routes.dart';
import 'package:ecommerce/core/styles/colors.dart';
import 'package:ecommerce/features/authentication/presentation/view/controller/login_cubit/login_cubit_cubit.dart';
import 'package:ecommerce/features/authentication/presentation/view/widgets/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/styles/app_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../../../generated/l10n.dart';
import 'auth_footer.dart';
import 'auth_header.dart';
import 'error_dialog.dart';
import 'text_feild_component.dart';

class SignInScreenBody extends StatefulWidget {
  const SignInScreenBody({super.key});

  @override
  State<SignInScreenBody> createState() => _SignInScreenBodyState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
GlobalKey<FormState> formkey = GlobalKey();

class _SignInScreenBodyState extends State<SignInScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: BlocConsumer<LoginCubit, LoginCubitState>(
            listener: (context, state) {
              if (state is LoginCubitFailure) {
                Navigator.pop(context);
                errorDialog(context, state);
              } else if (state is LoginCubitSuccess) {
                Navigator.pushNamed(context, Routes.home);
              } else if (state is LoginCubitLoading) {
                customLoadingIndicator(context);
              }
            },
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AuthHeader(
                      tilte: S.of(context).Sign_In_To_Your_Account,
                      subTitile: S.of(context).Lets_Sign_In,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    FadeInLeft(
                      child: TextFieldComponent(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return S.of(context).email_is_Required;
                            } else if (!value.contains("@")) {
                              return S.of(context).Enter_Correct_Email_like;
                            }
                            return null;
                          },
                          controller: emailController,
                          title: S.of(context).User_name,
                          icon: SvgPicture.asset('assets/images/Profile.svg'),
                          hint: S.of(context).Enter_Your_Username),
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    FadeInLeft(
                      child: TextFieldComponent(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return S.of(context).password_is_Required;
                          } else if (value.length < 8) {
                            return S.of(context).Minimum_8_characters;
                          }
                          return null;
                        },
                        obscureText: true,
                        controller: passwordController,
                        title: S.of(context).Password,
                        icon: SvgPicture.asset('assets/images/Unlock.svg'),
                        hint: S.of(context).Enter_your_password,
                      ),
                    ),
                    const SizedBox(
                      height: 39,
                    ),
                    FadeInRight(
                      child: CustomButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            BlocProvider.of<LoginCubit>(context).login(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          }
                        },
                        icon: SvgPicture.asset('assets/images/Login.svg'),
                        bgColor: AppColors.primaryColor,
                        text: Text(S.of(context).Sign_In,
                            style: AppStyles.font21Bold
                                .copyWith(color: Colors.white)),
                      ),
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.forgotPassword);
                      },
                      child: Text(
                        S.of(context).Forgot_Password,
                        style: AppStyles.font15Medium.copyWith(
                          color: AppColors.secondaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 36,
                    ),
                    const CustomDivider(),
                    const SizedBox(
                      height: 25,
                    ),
                    AuthFooter(
                      onPressed: () {
                        Navigator.popAndPushNamed(context, Routes.signUp);
                      },
                      text: S.of(context).Are_you_havent_account,
                      authOptionText: S.of(context).Sign_Up,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
