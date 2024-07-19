import 'package:ecommerce/core/routings/routes.dart';
import 'package:ecommerce/features/authentication/data/models/auth/phone_uath_cubit/phone_auth_cubit.dart';
import 'package:ecommerce/features/authentication/data/repos/auth_repo_impl.dart';
import 'package:ecommerce/features/authentication/presentation/view/controller/login_cubit/login_cubit_cubit.dart';
import 'package:ecommerce/features/authentication/presentation/view/controller/sign_up_cubit/sign_up_cubit_cubit.dart';
import 'package:ecommerce/features/authentication/presentation/view/screens/forgot_password_screen.dart';
import 'package:ecommerce/features/authentication/presentation/view/screens/sign_in_screen.dart';
import 'package:ecommerce/features/authentication/presentation/view/screens/sign_up_screen.dart';
import 'package:ecommerce/features/home/data/repos/home_repo_impl.dart';
import 'package:ecommerce/features/home/presentation/controller/banner_cubit/banner_cubit.dart';
import 'package:ecommerce/features/home/presentation/controller/category_cubit/category_cubit.dart';
import 'package:ecommerce/features/home/presentation/controller/favourite_product_cubit/add_and_remove_from_favourite/add_and_remove_from_favourite_cubit.dart';
import 'package:ecommerce/features/home/presentation/controller/products_cubit/products_cubit.dart';
import 'package:ecommerce/features/on_boarding/presentation/view/screens/intro_screen.dart';
import 'package:ecommerce/features/on_boarding/presentation/view/screens/on_boarding_screen.dart';
import 'package:ecommerce/features/settings/data/repos/settings_repo_impl.dart';
import 'package:ecommerce/features/settings/presentation/controller/change_password/change_password_cubit.dart';
import 'package:ecommerce/features/settings/presentation/controller/user_info_cubit/user_info_cubit.dart';
import 'package:ecommerce/features/settings/presentation/views/widgets/change_password_screen.dart';
import 'package:ecommerce/features/splash/presentation/views/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/authentication/presentation/view/widgets/otp_screen.dart';
import '../../features/home/presentation/controller/favourite_product_cubit/favourite_product_cubit.dart';
import '../../features/home/presentation/controller/products_cubit/products_filter/products_filter_cubit.dart';
import '../../features/home/presentation/views/screens/home_screen.dart';
import '../dependency_injection/service_locator.dart';

class AppRouter {
  Route onGenerateRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case Routes.onBoarding:
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen());
      case Routes.signUp:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SignUpCubit(
              getIt<AuthRepoImpl>(),
            ),
            child: const SignUpScreen(),
          ),
        );
      case Routes.signIn:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LoginCubit(
              getIt<AuthRepoImpl>(),
            ),
            child: const SignInScreen(),
          ),
        );
      case Routes.changePassword:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => ChangePasswordCubit(
              getIt<SettingsRepoimpl>(),
            ),
            child: const ChangePasswordScreen(),
          ),
        );
      case Routes.intro:
        return MaterialPageRoute(
          builder: (context) => const IntroScreen(),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) =>
                  UserInfoCubit(getIt<SettingsRepoimpl>())..getUserData(),
            ),
            BlocProvider(
              create: (context) =>
                  AddAndRemoveFromFavouriteCubit(getIt<HomeRepoImpl>()),
            ),
            BlocProvider(
              create: (context) =>
                  FavouriteProductCubit(getIt<HomeRepoImpl>())..getFavourites(),
            ),
            BlocProvider(
              create: (context) => ProductsFilterCubit(getIt<HomeRepoImpl>()),
            ),
            BlocProvider(
              create: (context) =>
                  CategoryCubit(getIt<HomeRepoImpl>())..getCategories(),
            ),
            BlocProvider(
              create: (context) =>
                  BannerCubit(getIt<HomeRepoImpl>())..getBanners(),
            ),
            BlocProvider(
              create: (context) =>
                  ProductsCubit(getIt<HomeRepoImpl>())..getProducts(),
            ),
          ], child: const HomeScreen()),
        );

      case Routes.forgotPassword:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => PhoneAuthCubit(),
            child: const ForgotPasswordScreen(),
          ),
        );
      case Routes.otp:
      final phoneNumber = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => PhoneAuthCubit(),
            child: OptScreen(phoneNuber: phoneNumber),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(),
        );
    }
  }
}
