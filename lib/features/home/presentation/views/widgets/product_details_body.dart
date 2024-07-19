import 'package:ecommerce/features/home/domin/home_entites/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/styles/app_styles.dart';
import '../../../../../core/styles/colors.dart';
import 'product_description.dart';
import 'review_card.dart';

class ProductsDetailsBody extends StatefulWidget {
  const ProductsDetailsBody({super.key, required this.products});
  final ProductEntity products;

  @override
  State<ProductsDetailsBody> createState() => _ProductsDetailsBodyState();
}

class _ProductsDetailsBodyState extends State<ProductsDetailsBody> {
  int amount = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 12,
        ),
        Text(
          widget.products.productName,
          style: AppStyles.font18SemiBold,
        ),
        const SizedBox(
          height: 3,
        ),
        Text(
          " ${widget.products.productPrice * amount} EGP",
          style: AppStyles.font165SemiBold
              .copyWith(color: AppColors.secondaryColor),
        ),
        const SizedBox(
          height: 3,
        ),
        Row(
          children: [
            Text(
              'Quantity',
              style: AppStyles.font16SemiBold
                  .copyWith(color: const Color(0XFF646464)),
            ),
            const Spacer(),
            IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  if (amount > 1) {
                    setState(() {
                      amount--;
                    });
                  } else {
                    setState(() {
                      amount = 1;
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        shape: BeveledRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0))),
                        elevation: 0,
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.redAccent,
                        content: Text(
                          'The amount can not be less than 1',
                          style: AppStyles.font15Bold,
                        ),
                      ));
                    });
                  }
                },
                icon: SvgPicture.asset('assets/images/muns_icon.svg')),
            Text(
              amount.toString(),
              style: AppStyles.font16Medium
                  .copyWith(color: AppColors.secondaryColor),
            ),
            IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  setState(() {
                    amount++;
                  });
                },
                icon: SvgPicture.asset('assets/images/plus_icon.svg')),
          ],
        ),
        const SizedBox(
          height: 18,
        ),
        const ReviewCard(),
        const SizedBox(
          height: 18,
        ),
        Description(
          products: widget.products,
        ),
        const SizedBox(
          height: 18,
        ),
      ],
    );
  }
}
