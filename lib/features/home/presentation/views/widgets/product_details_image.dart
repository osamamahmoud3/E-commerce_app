import 'package:ecommerce/core/styles/colors.dart';
import 'package:ecommerce/features/home/domin/home_entites/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ProductsDetailsImage extends StatelessWidget {
  const ProductsDetailsImage({
    super.key,
    required this.products,
    required this.image,
  });
  final ProductEntity products;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(right: 5),
        height: MediaQuery.of(context).size.height * 0.33,
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          child: PhotoView(
            enableRotation: true,
            loadingBuilder: (context, event) => Center(
              child: Container(
                  height: MediaQuery.sizeOf(context).height * 0.09,
                  width: MediaQuery.sizeOf(context).width * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                      child: CircularProgressIndicator(
                    value: event == null
                        ? 0
                        : event.cumulativeBytesLoaded /
                            event.expectedTotalBytes!,
                    color: AppColors.secondaryColor,
                  ))),
            ),
            backgroundDecoration: const BoxDecoration(
              color: Colors.white,
            ),
            filterQuality: FilterQuality.high,
            imageProvider: NetworkImage(image),
            maxScale: PhotoViewComputedScale.contained * 2,
            minScale: PhotoViewComputedScale.contained,
            initialScale: PhotoViewComputedScale.contained,
          ),
        ));
  }
}
