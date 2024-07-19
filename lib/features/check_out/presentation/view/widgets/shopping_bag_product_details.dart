import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:text_scroll/text_scroll.dart';

import '../../../../../core/styles/app_styles.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../generated/l10n.dart';

class ShoppingBagProductDetails extends StatelessWidget {
  const ShoppingBagProductDetails({
    super.key,
    required this.name,
    required this.price,
  });
  final String name, price;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 140,
              child: TextScroll(
                name,
                mode: TextScrollMode.endless,
                velocity: const Velocity(pixelsPerSecond: Offset(10, 0)),
                delayBefore: const Duration(seconds: 2),
                numberOfReps: 1000,
                pauseBetween: const Duration(milliseconds: 900),
                style: AppStyles.font13Medium.copyWith(color: Colors.black),
                textAlign: TextAlign.right,
                selectable: true,
              ),
            ),
            const Spacer(),
            IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {},
            ),
          ],
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            S.of(context).quantity,
            style: AppStyles.font13Medium,
          ),
          subtitle: Row(
            children: [
              IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/images/muns_icon.svg')),
              Text(
                '0',
                style: AppStyles.font16Medium
                    .copyWith(color: AppColors.secondaryColor),
              ),
              IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/images/plus_icon.svg')),
            ],
          ),
          trailing: Text(S.of(context).EGP + price,
              style: AppStyles.font13Medium
                  .copyWith(color: AppColors.secondaryColor)),
        )
      ],
    );
  }
}
