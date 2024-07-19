import 'package:flutter/material.dart';

class ThankYouCircleAvater extends StatelessWidget {
  const ThankYouCircleAvater({
    super.key,
    required this.postitionLeft, required this.postitionRight,
  });
  final double postitionLeft, postitionRight;
  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: postitionLeft,
        right: postitionRight,
        bottom: MediaQuery.sizeOf(context).width * 0.42,
        child: const CircleAvatar(
          backgroundColor: Colors.white,
        ));
  }
}
