import 'package:ecommerce/core/styles/app_styles.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:text_scroll/text_scroll.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key,
      required this.bgColor,
      required this.name,
      required this.image});
  final Color bgColor;
  final String name, image;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      height: 85,
      width: 160,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: bgColor),
      child: Row(
        children: [
          SizedBox(
              width: 75,
              child: TextScroll(
                name,
                mode: TextScrollMode.endless,
                velocity: const Velocity(pixelsPerSecond: Offset(10, 0)),
                delayBefore: const Duration(seconds: 2),
                numberOfReps: 1000,
                pauseBetween: const Duration(milliseconds: 900),
                style: AppStyles.font14SemiBold.copyWith(color: Colors.black),
                textAlign: TextAlign.right,
                selectable: true,
              )),
          const Spacer(),
          Container(
            height: 60,
            width: 60,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(999),
            ),
            child: FancyShimmerImage(
              imageUrl: image,
            ),
            // child: CachedNetworkImage(
            //   fit: BoxFit.fill,
            //   imageUrl: image,
            //   progressIndicatorBuilder: (context, url, downloadProgress) =>
            //       Center(
            //           child: CircularProgressIndicator(
            //               value: downloadProgress.progress,
            //               color: AppColors.secondaryColor)),
            //   errorWidget: (context, url, error) => const Icon(Icons.error),
            // ),
          ),
        ],
      ),
    );
  }
}
