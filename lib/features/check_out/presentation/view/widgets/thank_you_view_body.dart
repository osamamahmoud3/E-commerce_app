import 'package:flutter/material.dart';

import '../../../../../core/styles/colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'check_out_done.dart';
import 'custom_dashed_divider.dart';
import 'thank_you_card_content.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 20,
        left: 20,
      ),
      child: Stack(
        clipBehavior: Clip.none, // it prevent clip
        children: [
          const Padding(
            padding: EdgeInsets.only(
              bottom: 30,
            ),
            child: ThankYouCardContant(),
          ),
          Positioned(
              bottom: MediaQuery.sizeOf(context).width * 0.42 + 20,
              left: 20 + 8,
              right: 20 + 8,
              child: const CustomDashedDivider()),
          const CheckOutDone(),
          Positioned(
              left: -20,
              bottom: MediaQuery.sizeOf(context).width * 0.42,
              child: const CircleAvatar(
                backgroundColor: Color(0xffEDEDED),
              )),
          Positioned(
              right: -20,
              bottom: MediaQuery.sizeOf(context).width * 0.42,
              child: const CircleAvatar(
                backgroundColor: Color(0xffEDEDED),
              )),
          Positioned(
            bottom: -5,
            left: 20,
            right: 20,
            child: CustomButton(
              bgColor: AppColors.primaryColor,
              text: const Text('Back to Home'),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
