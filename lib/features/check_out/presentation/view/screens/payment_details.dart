
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_app_bar_2.dart';
import '../widgets/payment_details_body.dart';

class PaymentDetails extends StatelessWidget {
  const PaymentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(
            title: 'Payment Details',
            onTap: () {
              Navigator.pop(context);
            }),
        body: const PaymentDetailsBody());
  }
}
