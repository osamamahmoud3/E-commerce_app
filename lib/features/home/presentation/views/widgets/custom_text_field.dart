import 'package:flutter/material.dart';

import '../../../../../core/styles/app_styles.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../generated/l10n.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.textFieldOnChanged,
  });

  final void Function(String p1)? textFieldOnChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: textFieldOnChanged,
      scrollPadding: EdgeInsets.zero,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          focusedBorder: OutlineInputBorder(
            gapPadding: 3,
            borderRadius: BorderRadius.circular(7),
            borderSide: const BorderSide(color: AppColors.primaryColor),
          ),
          hintStyle: AppStyles.font15Regular.copyWith(
            color: AppColors.grey,
          ),
          hintText: S.of(context).Search_what_you_want,
          border: const OutlineInputBorder(
              gapPadding: 8,
              borderRadius: BorderRadius.all(Radius.circular(7)),
              borderSide: BorderSide(color: AppColors.lightGrey))),
    );
  }
}
