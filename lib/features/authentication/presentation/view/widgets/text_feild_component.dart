import 'package:ecommerce/core/styles/app_styles.dart';
import 'package:ecommerce/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TextFieldComponent extends StatelessWidget {
  const TextFieldComponent(
      {super.key,
      required this.title,
      required this.icon,
      required this.hint,
      this.onChanged,
      this.validator,
      this.controller,
      this.obscureText,
      this.onSubmitted});
  final String title;
  final SvgPicture icon;
  final String hint;
  final bool? obscureText;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.font17Medium,
        ),
        const SizedBox(
          height: 11,
        ),
        Row(
          children: [
            icon,
            const SizedBox(width: 18),
            Expanded(
                child: TextFormField(
              obscureText: obscureText ?? false,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: controller,
              validator: validator,
              onChanged: onChanged,
              onFieldSubmitted: onSubmitted,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    gapPadding: 3,
                    borderRadius: BorderRadius.circular(7),
                    borderSide: const BorderSide(color: AppColors.primaryColor),
                  ),
                  hintStyle:
                      AppStyles.font15Regular.copyWith(color: AppColors.grey),
                  hintText: hint,
                  filled: true,
                  fillColor: AppColors.lightGrey,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                    borderSide: BorderSide.none,
                  )),
            ))
          ],
        )
      ],
    );
  }
}
