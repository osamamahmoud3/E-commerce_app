import 'package:ecommerce/features/home/domin/home_entites/product_entity.dart';
import 'package:ecommerce/features/home/presentation/views/widgets/selected_and_inselected_item.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:readmore/readmore.dart';

import '../../../../../core/styles/app_styles.dart';
import '../../../../../core/styles/colors.dart';
import 'read_more_text_widget.dart';

class Description extends StatefulWidget {
  const Description({super.key, required this.products});
  final ProductEntity products;
  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  bool selected = true;
  int currentINdex = 0;
  List<SelectedItem> item = [
    const SelectedItem(
      selected: true,
      name: 'Description',
    ),
    const SelectedItem(
      selected: false,
      name: 'Reviews',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: item.asMap().entries.map((e) {
            var index = e.key;

            return Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    currentINdex = index;
                    setState(() {});
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SelectedItem(
                    name: e.value.name,
                    selected: currentINdex == index,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(
          height: 14,
        ),
        currentINdex == 0
            ? ReadMoreTextWidget(widget: widget)
            : Center(
                child: Lottie.asset('assets/animate_images/no_comments.json',
                    fit: BoxFit.scaleDown, height: 120)),
      ],
    );
  }
}
