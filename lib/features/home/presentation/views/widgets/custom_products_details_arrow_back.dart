import 'package:flutter/material.dart';

class CustomProductsDetailsArrowBack extends StatelessWidget {
  const CustomProductsDetailsArrowBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 26,
      width: 35,
      decoration: BoxDecoration(
        color: const Color(0XFF979797),
        borderRadius: BorderRadius.circular(7),
      ),
      child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          )),
    );
  }
}
