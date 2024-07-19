import 'package:flutter/material.dart';
import '../../../../../core/styles/app_styles.dart';
import '../../../../../core/styles/colors.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter(
      {super.key,
      required this.text,
      required this.authOptionText,
      this.onPressed});
  final String text;
  final String authOptionText;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          text,
          style:
              AppStyles.font15Medium.copyWith(color: const Color(0Xff757575)),
        ),
        TextButton(
            onPressed: onPressed,
            child: Text(
              authOptionText,
              style: AppStyles.font15Bold
                  .copyWith(color: AppColors.secondaryColor),
            ))
      ],
    );
  }
}
