import 'package:flutter/material.dart';

import '../../../../../core/styles/app_styles.dart';
import '../../../../../core/styles/colors.dart';

class SelectedItem extends StatelessWidget {
  const SelectedItem({
    super.key,
    required this.name,
    required this.selected,
  });
  final String name;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: selected ? AppColors.secondaryColor : Colors.white),
      child: Center(
        child: Text(
          name,
          style: selected
              ? AppStyles.font15Bold.copyWith(color: Colors.white)
              : const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
