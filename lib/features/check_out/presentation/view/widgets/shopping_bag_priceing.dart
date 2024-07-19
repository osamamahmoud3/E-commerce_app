import 'package:flutter/material.dart';

import '../../../../../core/styles/app_styles.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../generated/l10n.dart';
import '../screens/address_screen.dart';

class ShoppingBagPriceing extends StatelessWidget {
  const ShoppingBagPriceing({
    super.key,
    required this.totLPrice,
  });
  final String totLPrice;
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Color(0XFFF1EFEF),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              flex: 2,
              child: CustomButton(
                  text: Text(
                    S.of(context).Buy_Now,
                    style: AppStyles.font20Medium.copyWith(color: Colors.white),
                  ),
                  bgColor: AppColors.primaryColor,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const AdressScreen(
                        
                      );
                    }));
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) {
                    //   return CheckOutView(
                    //     price: totLPrice,
                    //   );
                    // }));
                  }),
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  S.of(context).Total,
                  style: AppStyles.font165SemiBold,
                ),
                Text(
                  totLPrice,
                  style: AppStyles.font18Blod
                      .copyWith(color: AppColors.primaryColor),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
