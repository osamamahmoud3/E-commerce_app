import 'package:flutter/widgets.dart';

import '../../../../../core/styles/app_styles.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../generated/l10n.dart';

class ExitIcon extends StatelessWidget {
  const ExitIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            border: Border.all(
              width: 2,
              color: AppColors.secondaryColor,
            ),
          ),
          child: Text(
            S.of(context).Exit,
            style:
                AppStyles.font15Bold.copyWith(color: AppColors.secondaryColor),
          )),
    );
  }
}
