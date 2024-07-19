import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/features/home/presentation/controller/banner_cubit/banner_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'banner_image.dart';

class ProductsBanner extends StatefulWidget {
  const ProductsBanner({super.key});

  @override
  State<ProductsBanner> createState() => _ProductsBannerState();
}

class _ProductsBannerState extends State<ProductsBanner> {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannerCubit, BannerState>(builder: (context, state) {
      if (state is BannerSuccess) {
        return Column(
          children: [
            CarouselSlider.builder(
              itemCount: state.banners.length,
              itemBuilder: (context, index, realIndex) {
                return BannerItem(
                  image: state.banners[index].bannerImage,
                );
              },
              options: CarouselOptions(
                height: 95,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
            )
          ],
        );
      } else if (state is BannerFailure) {
        return Center(child: Text(state.message));
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
