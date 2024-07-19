import 'package:ecommerce/features/home/presentation/controller/category_cubit/category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/styles/app_styles.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../generated/l10n.dart';
import 'category_item.dart';

class CategoryComponent extends StatelessWidget {
  const CategoryComponent({super.key});
  static const listColor = [
    Color(0XFFE3FEF7),
    Color(0XFF77B0AA),
    Color(0XFF135D66),
    Color(0XFFFF8080),
    Color(0XFFEDD9B8),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryCubitState>(
      builder: (context, state) {
        if (state is CategoryCubitSucess) {
          return Column(
            children: [
              Row(
                children: [
                  Text(
                    S.of(context).Categories,
                    style: AppStyles.font18Blod,
                  ),
                  const Spacer(),
                  Text(
                    S.of(context).See_All,
                    style: AppStyles.font13Medium
                        .copyWith(color: AppColors.secondaryColor),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  SvgPicture.asset('assets/images/arraw.svg')
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 85,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: listColor.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: CategoryItem(
                          name: state.categories[index].categoryName,
                          image: state.categories[index].categoryImage,
                          bgColor: listColor[index],
                        ),
                      );
                    }),
              )
            ],
          );
        } else if (state is CategoryCubitFailure) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
