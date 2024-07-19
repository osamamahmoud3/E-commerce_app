import 'package:dio/dio.dart';
import 'package:ecommerce/core/network/api_service.dart';
import 'package:ecommerce/core/styles/app_styles.dart';
import 'package:ecommerce/core/styles/colors.dart';
import 'package:ecommerce/features/check_out/data/data_source/cart_remote_data_source/cart_remote_data_source_impl.dart';
import 'package:ecommerce/features/check_out/data/repos/check_out_repo_impl.dart';
import 'package:ecommerce/features/home/presentation/views/screens/favourite_screen.dart';
import 'package:ecommerce/features/settings/presentation/views/screens/settings_screen.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../generated/l10n.dart';
import '../../../../check_out/presentation/controller/Get_cart_items_controller/get_cart_cubit.dart';
import '../../../../check_out/presentation/view/screens/check_out_screen.dart';
import '../widgets/home_screen_body.dart';

int numberOfFavouritesItems = 0;
ValueNotifier<int> count = ValueNotifier<int>(1);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  PageController pageController = PageController();
  void pageChanged(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  int numberOfFavouritesItem = 0;

  void bottomTapped(int index) {
    setState(() {
      selectedIndex = index;
      pageController.animateToPage(index,
          duration: const Duration(milliseconds: 100), curve: Curves.ease);
    });
  }

  @override
  void setState(VoidCallback fn) {
    numberOfFavouritesItem = numberOfFavouritesItems;
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        bottomNavigationBar: FlashyTabBar(
          height: 55,
          iconSize: 25,
          selectedIndex: selectedIndex,
          showElevation: true,
          onItemSelected: (index) {
            bottomTapped(index);
          },
          items: [
            FlashyTabBarItem(
              activeColor: AppColors.primaryColor,
              icon: SvgPicture.asset('assets/images/home_un_selected.svg'),
              title: Text(
                S.of(context).home,
                style: AppStyles.font14Bold
                    .copyWith(color: AppColors.primaryColor),
              ),
            ),
            FlashyTabBarItem(
              activeColor: AppColors.primaryColor,
              icon: SvgPicture.asset('assets/images/cart_un_selected.svg'),
              title: Text(
                S.of(context).Cart,
                style: AppStyles.font14Bold
                    .copyWith(color: AppColors.primaryColor),
              ),
            ),
            FlashyTabBarItem(
              activeColor: AppColors.primaryColor,
              icon: Badge(
                  offset: const Offset(10, -10),
                  backgroundColor: numberOfFavouritesItem == 0
                      ? Colors.transparent
                      : Colors.red,
                  label: Text(numberOfFavouritesItem.toString()),
                  alignment: AlignmentDirectional.topEnd,
                  child: SvgPicture.asset(
                      'assets/images/favourite_un_selected.svg')),
              title: Text(
                S.of(context).Favourite,
                style: AppStyles.font14Bold
                    .copyWith(color: AppColors.primaryColor),
              ),
            ),
            FlashyTabBarItem(
              activeColor: AppColors.primaryColor,
              icon: SvgPicture.asset('assets/images/settings_un_selected.svg'),
              title: Text(
                S.of(context).Settings,
                style: AppStyles.font14Bold
                    .copyWith(color: AppColors.primaryColor),
              ),
            ),
          ],
        ),
        body: PageView(
            controller: pageController,
            onPageChanged: (index) {
              pageChanged(index);
            },
            children: screens));
  }
}

List<Widget> screens = [
  const HomeScreenBody(),
  BlocProvider(
    create: (context) => GetCartCubit(CheckOUtRepoImpl(
        cartRemoteDataSource:
            CartRemoteDataSourceImpl(apiService: ApiService(dio: Dio()))))
      ..getCartItems(),
    child: const CheckOutScreen(),
  ),
  const FavouriteScreen(),
  const SettingsScreen()
];
