import 'package:ecommerce/features/home/domin/home_entites/product_entity.dart';
import 'package:ecommerce/kutuku_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/dependency_injection/service_locator.dart';
import 'core/network/authorize_user.dart';
import 'core/network/bloc_observer.dart';
import 'core/notifications/local_notifications.dart';
import 'core/utils/constants.dart';
import 'features/home/domin/home_entites/banner_entity.dart';
import 'features/home/domin/home_entites/category_entity.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Stripe.publishableKey =
      "pk_test_51Or0k3I4yLWwD4fka6lZabJ5V3xWjqyU2A7g9a19laXBCIyTXldFAaeaj6L40Y8HgbVqAfvVPaunElUo8cNXRyot00XPwGZaQF";

  await Stripe.instance.applySettings();
  await Hive.initFlutter();
  setup();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(ProductEntityAdapter());
  Hive.registerAdapter(CategoryEntityAdapter());
  Hive.registerAdapter(BannerEntityAdapter());
  await Hive.openBox<ProductEntity>(productHiveKey);
  await Hive.openBox<CategoryEntity>(categoryHiveKey);
  await LocalNotificationService.init();
  await Hive.openBox<BannerEntity>(bannerHiveKey);
  await CacheNetwork.sharedPreferencesIntilization();
  token = CacheNetwork.getFromCache(key: 'token');
  print("The Token is $token");
  runApp(const Kutuku());
}
