import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rating_summary/rating_summary.dart';

import '../../../../home/presentation/views/screens/about_details.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 12,
              ),
              const SizedBox(
                height: 12,
              ),
              SvgPicture.asset('assets/images/app_name.svg'),
              const SizedBox(
                height: 12,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: AboutDetails(),
              ),
              const Expanded(
                child: SizedBox(
                  height: 12,
                ),
              ),
              const RatingSummary(
                counter: 13,
                average: 2,
                showAverage: true,
                counterFiveStars: 50,
                counterFourStars: 10,
                counterThreeStars: 2,
                counterTwoStars: 1,
                counterOneStars: 1,
              ),
              const SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
