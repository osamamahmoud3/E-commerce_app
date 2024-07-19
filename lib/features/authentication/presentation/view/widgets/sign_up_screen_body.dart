import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/routings/routes.dart';
import '../../../../../core/styles/app_styles.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../../../generated/l10n.dart';
import '../controller/sign_up_cubit/sign_up_cubit_cubit.dart';
import 'auth_footer.dart';
import 'auth_header.dart';
import 'custom_divider.dart';
import 'error_dialog.dart';
import 'text_field_column.dart';

class SignUpScreenBody extends StatefulWidget {
  const SignUpScreenBody({super.key});

  @override
  State<SignUpScreenBody> createState() => _SignUpScreenBodyState();
}

class _SignUpScreenBodyState extends State<SignUpScreenBody> {
  GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpCubitState>(
      listener: (context, state) {
        if (state is SignUpCubitFailure) {
          Navigator.pop(context);
          errorDialog(context, state);
        } else if (state is SignUpCubitSuccess) {
          Navigator.pop(context);
          Navigator.pushNamed(context, Routes.signIn);
        } else if (state is SignUpCubitLoading) {
          customLoadingIndicator(context);
        }
      },
      builder: (context, state) {
        return SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Form(
            key: formkey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  AuthHeader(
                    tilte: S.of(context).Sign_Up_Here,
                    subTitile: S.of(context).Lets_Create_Your_Account,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFieldColumn(
                    nameController: nameController,
                    emailController: emailController,
                    phoneController: phoneController,
                    passwordController: passwordController,
                  ),
                  CustomButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        BlocProvider.of<SignUpCubit>(context).signUp(
                            name: nameController.text,
                            phoneNumber: phoneController.text,
                            email: emailController.text,
                            password: passwordController.text);
                      }
                    },
                    icon: SvgPicture.asset('assets/images/sigh_up_icon.svg'),
                    bgColor: AppColors.primaryColor,
                    text: Text(S.of(context).Sign_Up,
                        style:
                            AppStyles.font21Bold.copyWith(color: Colors.white)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomDivider(),
                  const SizedBox(
                    height: 15,
                  ),
                  AuthFooter(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, Routes.signIn);
                    },
                    text: '${S.of(context).Already_have_an_Account} ',
                    authOptionText: S.of(context).Sign_In,
                  )
                ],
              ),
            ),
          ),
        ));
      },
    );
  }
}
