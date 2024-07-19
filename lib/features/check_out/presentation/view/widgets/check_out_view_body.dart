import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/network/stripe_service.dart';
import '../../../../../core/notifications/local_notifications.dart';
import '../../../../../core/widgets/widgets/custom_button.dart';
import '../screens/thank_you_view.dart';
import 'priceing_detils.dart';

class CheckOutViewBody extends StatelessWidget {
  CheckOutViewBody({super.key, required this.price});
  final String price;
  final StripeService _stripeService = StripeService();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Flexible(
              child:
                  Lottie.asset('assets/animate_images/pay.json', repeat: true)),
          const Expanded(child: SizedBox()),
          PriceingDetils(
            price: price,
          ),
          CustomButton(
              text: 'Complete Payment',
              onPressed: () async {
                await _stripeService.makePayment(
                  amount: '100',
                  currency: 'usd',
                );
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ThankYouView();
                }));
                LocalNotificationService.showbasicNotification(
                    massBody: 'Payment Successfull');
                // showModalBottomSheet(
                //     context: context,
                //     builder: (context) {
                //       return const ShowModelBottomSheetView();
                //     });
                //   Navigator.push(context, MaterialPageRoute(builder: (context) {
                //     return const PaymentDetails();
                //   }));
                // }),),
              }),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
