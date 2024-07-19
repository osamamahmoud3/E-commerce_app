import 'package:ecommerce/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ActivePaymentOptionsItem extends StatelessWidget {
  const ActivePaymentOptionsItem({super.key, required this.paymentMethod});
  final String paymentMethod;
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
      height: 60,

      decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.gray),
          borderRadius: BorderRadius.circular(15)),
      child: Center(
          child: SvgPicture.asset(
        paymentMethod,
        fit: BoxFit.scaleDown,
      )),
    );
  }
}

class InActivePaymentOptionsItem extends StatelessWidget {
  const InActivePaymentOptionsItem({super.key, required this.paymentMethod});
  final String paymentMethod;
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
      height: 60,
      decoration: BoxDecoration(
          border: Border.all(
            width: 1.5,
            color: Colors.red,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.red,
              spreadRadius: 0,
              blurRadius: 3,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(15)),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Center(
              child: SvgPicture.asset(
            paymentMethod,
            fit: BoxFit.scaleDown,
          ))),
    );
  }
}
