import 'package:ecommerce/core/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../generated/l10n.dart';
import 'custom_search_icon.dart';
import 'custom_text_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key, this.textFieldOnChanged});
  final void Function(String)? textFieldOnChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              S.of(context).Explore_What_You_Needs,
              style: AppStyles.font21Bold,
            ),
            const Spacer(),
            SvgPicture.asset('assets/images/notification_icon.svg'),
            const SizedBox(
              width: 20,
            ),
            SvgPicture.asset('assets/images/logout_icon.svg'),
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          children: [
            Expanded(
              child: CustomTextField(textFieldOnChanged: textFieldOnChanged),
            ),
            const SizedBox(
              width: 6,
            ),
            const CustomSearchIcon(),
          ],
        ),
      ],
    );
  }
}
