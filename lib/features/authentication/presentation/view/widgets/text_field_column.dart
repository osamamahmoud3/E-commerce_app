import 'package:ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'text_feild_component.dart';

class TextFieldColumn extends StatelessWidget {
  const TextFieldColumn({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.phoneController,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldComponent(
          validator: (value) {
            if (value!.isEmpty) {
              return S.of(context).email_is_Required;
            }
            return null;
          },
          controller: nameController,
          title: S.of(context).User_name,
          icon: SvgPicture.asset('assets/images/Profile.svg'),
          hint: S.of(context).Enter_Your_Username,
        ),
        const SizedBox(
          height: 24,
        ),
        TextFieldComponent(
          validator: (value) {
            if (value!.isEmpty) {
              return S.of(context).email_is_Required;
            } else if (!value.contains("@")) {
              return S.of(context).Enter_Correct_Email_like;
            }
            return null;
          },
          controller: emailController,
          title: S.of(context).Email,
          icon: SvgPicture.asset('assets/images/email_icon.svg'),
          hint: S.of(context).Enter_Your_Email,
        ),
        const SizedBox(
          height: 25,
        ),
        TextFieldComponent(
          validator: (value) {
            if (value!.isEmpty) {
              return S.of(context).password_is_Required;
            } else if (!value.startsWith("010") &&
                !value.startsWith("011") &&
                !value.startsWith("012") &&
                !value.startsWith("015")) {
              return S.of(context).Enter_Correct_Number_like;
            } else if (value.length < 11) {
              return S.of(context).Minimum_8_Number;
            }
            return null;
          },
          controller: phoneController,
          title: S.of(context).Phone_Number,
          icon: SvgPicture.asset('assets/images/Profile.svg'),
          hint: S.of(context).Enter_Your_Number,
        ),
        const SizedBox(
          height: 24,
        ),
        TextFieldComponent(
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
        const SizedBox(
          height: 39,
        )
      ],
    );
  }
}
