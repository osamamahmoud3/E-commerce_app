
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_app_bar_2.dart';
import '../widgets/check_out_view_body.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({super.key, required this.price});
  final String price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'My Cart'),
      body:  CheckOutViewBody(
        price: price,
      ),
    );
  }
}
