import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/styles/app_styles.dart';
import 'cart_info_contailer.dart';
import 'custom_thank_you_info_row.dart';
import 'paid_done_widget.dart';
import 'total_price.dart';

class ThankYouCardContant extends StatelessWidget {
  const ThankYouCardContant({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(children: [
        const SizedBox(
          height: 50,
        ),
        const Text(
          "Thank you!",
          style: AppStyles.font25medium,
        ),
        const SizedBox(
          height: 2,
        ),
        const Text(
          'Your transaction was successful',
          style: AppStyles.font16regular,
        ),
        const SizedBox(
          height: 42,
        ),
        const CustomThankYouInfoRow(
          thankYouInfoName: "Date",
          date: "01/24/2023",
        ),
        const SizedBox(
          height: 12,
        ),
        const CustomThankYouInfoRow(
          thankYouInfoName: "Time",
          date: "10:15 AM",
        ),
        const SizedBox(
          height: 12,
        ),
        const CustomThankYouInfoRow(
          thankYouInfoName: "To",
          date: "Sam Louis",
        ),
        const SizedBox(
          height: 12,
        ),
        const Divider(
          thickness: 2,
        ),
        const SizedBox(
          height: 12,
        ),
        const TotalPrice(
          price: "200",
        ),
        const SizedBox(
          height: 12,
        ),
        const CartInfoContainer(),
        const Spacer(),
        Row(
          children: [
            SvgPicture.asset(
              "assets/images/paid_qi_code.svg",
              height: 65,
            ),
            const SizedBox(
              width: 40,
            ),
            const Expanded(child: PaidDone()),
            SizedBox(height: MediaQuery.sizeOf(context).width * 0.42 + 10)
          ],
        )
      ]),
    );
  }
}
