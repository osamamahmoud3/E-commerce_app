import 'package:ecommerce/core/styles/colors.dart';
import 'package:ecommerce/features/check_out/presentation/view/widgets/shopping_bag_product_details.dart';
import 'package:flutter/material.dart';

class MyShoppingBagItem extends StatelessWidget {
  const MyShoppingBagItem(
      {super.key,
      required this.image,
      required this.name,
      required this.price});
  final String image, name, price;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.primaryColor),
          child: Container(
            margin: const EdgeInsets.all(1.5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16), color: Colors.white),
            child: Row(
              children: [
                const SizedBox(
                  width: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 100,
                  height: 110,
                  child: Image(
                    image: NetworkImage(
                      image,
                    ),
                    fit: BoxFit.scaleDown,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 11),
                    child: ShoppingBagProductDetails(
                      name: name,
                      price: price,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const Divider(
          color: AppColors.primaryColor,
          thickness: 1.5,
          indent: 17,
          endIndent: 17,
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
