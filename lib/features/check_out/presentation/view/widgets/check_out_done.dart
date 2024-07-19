import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CheckOutDone extends StatelessWidget {
  const CheckOutDone({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: -45,
        right: 0,
        left: 0,
        child: CircleAvatar(
          radius: 45,
          backgroundColor: const Color(0xffEDEDED),
          child: CircleAvatar(
            radius: 40,
            backgroundColor: const Color(0XFF34A853),
            child: Center(
              child: Lottie.asset('assets/animate_images/payment_done.json',
                  fit: BoxFit.fill, repeat: true, animate: true),
            ),
          ),
        ));
  }
}
