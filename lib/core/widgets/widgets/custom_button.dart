
import 'package:flutter/material.dart';

import '../../styles/app_styles.dart';
import '../../styles/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onPressed});
  final String text;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        minWidth: double.infinity,
        height: 65,
        color: AppColors.green,
        onPressed: onPressed,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
        child: Text(text, style: AppStyles.font22medium));
  }
}
