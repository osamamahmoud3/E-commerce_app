import 'package:flutter/material.dart';

import 'priceing_row.dart';
import 'total_price.dart';

class PriceingDetils extends StatelessWidget {
  const PriceingDetils({super.key, required this.price});
  final String price;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PriceingRow(title: 'Order Subtotal', price: price),
        const PriceingRow(title: 'Discount', price: "\$0"),
        const PriceingRow(title: 'Shipping', price: "\$8"),
        const Divider(
          thickness: 2,
          indent: 15,
          endIndent: 15,
        ),
        const SizedBox(
          height: 15,
        ),
        TotalPrice(
          price: price,
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
