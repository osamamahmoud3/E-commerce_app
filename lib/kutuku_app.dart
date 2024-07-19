import 'package:ecommerce/core/routings/app_router.dart';
import 'package:ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/language_cubit/language_cubit.dart';
import 'core/routings/routes.dart';

String lag = 'ar';

class Kutuku extends StatelessWidget {
  const Kutuku({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LanguageCubitCubit(),
      child: BlocBuilder<LanguageCubitCubit, Locale>(
        builder: (context, lang) {
          S.load(lang);
          return MaterialApp(
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale: lang,
            darkTheme: ThemeData.dark(),
            theme: ThemeData(scaffoldBackgroundColor: const Color(0XFFF1EFEF)),
            onGenerateRoute: (settings) =>
                AppRouter().onGenerateRoute(settings),
            initialRoute: Routes.splash,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
