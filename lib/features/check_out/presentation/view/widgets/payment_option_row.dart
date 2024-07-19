import 'package:flutter/material.dart';

import 'payment_option_item.dart';

class PaymentOptionsRow extends StatefulWidget {
  const PaymentOptionsRow({super.key});
  static const List<String> paymentMethod = [
    'assets/images/payment_method1.svg',
    "assets/images/payment_method2.svg",
  ];

  @override
  State<PaymentOptionsRow> createState() => _PaymentOptionsRowState();
}

int selectedIndex = 0;

class _PaymentOptionsRowState extends State<PaymentOptionsRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
        children: PaymentOptionsRow.paymentMethod.asMap().entries.map((e) {
      int index = e.key;
      var value = e.value;
      return Expanded(
        child: GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: PaymentOptionItem(
                paymentMethod: value, isactive: selectedIndex == index),
          ),
        ),
      );
    }).toList());
  }
}
