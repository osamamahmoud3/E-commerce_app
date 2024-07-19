import 'package:flutter/material.dart';

import 'active_inactive_payment_option_item.dart';

class PaymentOptionItem extends StatelessWidget {
  const PaymentOptionItem(
      {super.key, required this.paymentMethod, required this.isactive});
  final String paymentMethod;
  final bool isactive;
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 300),
      crossFadeState:
          isactive ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      firstChild: InActivePaymentOptionsItem(
        paymentMethod: paymentMethod,
      ),
      secondChild: ActivePaymentOptionsItem(
        paymentMethod: paymentMethod,
      ),
    );
  }
}
