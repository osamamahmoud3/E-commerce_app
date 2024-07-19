import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class BannerItem extends StatelessWidget {
  const BannerItem({
    super.key,
    required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      child: SizedBox(
        height: 80,
        width: double.infinity,
        child: FancyShimmerImage(
          imageUrl: image,
        ),
        // child: CachedNetworkImage(
        //   fit: BoxFit.fill,
        //   imageUrl: image,
        //   progressIndicatorBuilder: (context, url, downloadProgress) => Center(
        //     child: CircularProgressIndicator(
        //         color: AppColors.secondaryColor,
        //         value: downloadProgress.progress),
        //   ),
        //   errorWidget: (context, url, error) => const Icon(Icons.error),
        // ),
      ),
    );
  }
}
