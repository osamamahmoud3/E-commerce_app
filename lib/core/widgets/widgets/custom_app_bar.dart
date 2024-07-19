
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../styles/app_styles.dart';
import '../assests.dart';

PreferredSizeWidget customAppBar({String? title, void Function()? onTap}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    leading: GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        Assets.imagesBackArrow,
        fit: BoxFit.scaleDown,
      ),
    ),
    centerTitle: true,
    title: Text(
      title ?? '',
      style: AppStyles.font25medium,
    ),
  );
}
