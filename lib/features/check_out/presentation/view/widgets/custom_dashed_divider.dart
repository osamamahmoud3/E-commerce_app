import 'package:flutter/material.dart';

class CustomDashedDivider extends StatelessWidget {
  const CustomDashedDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
          30,
          (index) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Container(
                    height: 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ),
                ),
              )),
    );
  }
}
