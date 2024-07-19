import 'package:flutter/material.dart';

import '../styles/app_styles.dart';

PreferredSizeWidget customAppBar({String? title, void Function()? onTap}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    leading: GestureDetector(
      onTap: onTap,
      child: const Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
      ),
    ),
    centerTitle: true,
    title: Text(
      title ?? '',
      style: AppStyles.font21Bold,
    ),
  );
}
