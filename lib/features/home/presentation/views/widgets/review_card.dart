import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/styles/app_styles.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: ListTile(
          title: Row(
            children: [
              SvgPicture.asset('assets/images/star.svg'),
              const SizedBox(
                width: 13,
              ),
              const Text(
                '3.7',
                style: AppStyles.font13Medium,
              )
            ],
          ),
          subtitle: const Text(
            "120 Reviews",
            style: AppStyles.font13Medium,
          ),
          trailing: Image.asset('assets/images/Group.png')),
    );
  }
}
