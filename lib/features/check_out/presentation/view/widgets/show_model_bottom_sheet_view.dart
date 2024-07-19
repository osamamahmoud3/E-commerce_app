import 'package:flutter/material.dart';

import '../../../../../core/widgets/widgets/custom_button.dart';
import '../screens/thank_you_view.dart';

import 'payment_option_row.dart';

class ShowModelBottomSheetView extends StatelessWidget {
  const ShowModelBottomSheetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const PaymentOptionsRow(),
          const SizedBox(
            height: 10,
          ),
          CustomButton(
              text: 'Pay',
              onPressed: () async {
                // final paymentMethod = await Stripe.instance.createPaymentMethod(
                //     params: const PaymentMethodParams.card(
                //         paymentMethodData: PaymentMethodData()));
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ThankYouView();
                }));
              })
        ],
      ),
    );
  }
}
