import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:text_scroll/text_scroll.dart';

import '../../../../../core/styles/app_styles.dart';
import '../../../../../core/styles/colors.dart';

class FavouriteItem extends StatelessWidget {
  const FavouriteItem({
    super.key,
    required this.image,
    required this.productName,
    required this.price,
    this.onTap,
  });
  final String image;
  final String productName;
  final String price;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: CachedNetworkImage(
              fit: BoxFit.scaleDown,
              imageUrl: image,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress)),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 140,
                  child: TextScroll(
                    productName,
                    mode: TextScrollMode.endless,
                    velocity: const Velocity(pixelsPerSecond: Offset(10, 0)),
                    delayBefore: const Duration(seconds: 2),
                    numberOfReps: 1000,
                    pauseBetween: const Duration(milliseconds: 900),
                    style: AppStyles.font13Medium.copyWith(color: Colors.black),
                    textAlign: TextAlign.right,
                    selectable: true,
                  ),
                ),
                Text(
                  price,
                  style: AppStyles.font13Medium
                      .copyWith(color: AppColors.secondaryColor),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
