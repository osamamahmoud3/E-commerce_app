import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:ecommerce/core/dependency_injection/service_locator.dart';
import 'package:ecommerce/core/language_cubit/language_cubit.dart';
import 'package:ecommerce/core/network/authorize_user.dart';
import 'package:ecommerce/features/biometric_authentication/presentation/views/screens/biometric_auth_view.dart';
import 'package:ecommerce/features/settings/data/repos/settings_repo_impl.dart';
import 'package:ecommerce/features/settings/presentation/controller/about_app_cubit/about_app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/routings/routes.dart';
import '../../../../../core/styles/app_styles.dart';
import '../../../../../generated/l10n.dart';
import 'about_app.dart';

class SettingsBody extends StatefulWidget {
  const SettingsBody({super.key});

  @override
  State<SettingsBody> createState() => _SettingsBodyState();
}

class _SettingsBodyState extends State<SettingsBody> {
  bool lang = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingsGroup(
          items: [
            SettingsItem(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  return const BiometricAuthView(
                      pageRoute: Routes.changePassword);
                })));
              },
              icons: Icons.lock,
              iconStyle: IconStyle(),
              title: S.of(context).Change_Password,
            ),
            SettingsItem(
              onTap: () {},
              icons: Icons.language,
              iconStyle: IconStyle(
                iconsColor: Colors.white,
                withBackground: true,
                backgroundColor: Colors.red,
              ),
              title: S.of(context).Language,
              subtitle: S.of(context).Automatic,
              trailing: Switch.adaptive(
                value: lang,
                onChanged: (value) {
                  setState(() {
                    lang = value;
                    if (lang) {
                      BlocProvider.of<LanguageCubitCubit>(context)
                          .changeLangAr(context);
                    } else {
                      BlocProvider.of<LanguageCubitCubit>(context)
                          .changeLangEn(context);
                    }
                  });
                },
              ),
            ),
          ],
        ),
        SettingsGroup(
          items: [
            SettingsItem(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (context) =>
                          AboutAppCubit(getIt<SettingsRepoimpl>())
                            ..getAboutApp(),
                      child: const AboutApp(),
                    ),
                  ),
                );
              },
              icons: Icons.info_rounded,
              iconStyle: IconStyle(
                backgroundColor: Colors.purple,
              ),
              title: S.of(context).About,
              subtitle: S.of(context).Learn_more_about_Kur_EShopApp,
            ),
          ],
        ),
        // You can add a settings title
        SettingsGroup(
          settingsGroupTitle: "Account",
          items: [
            SettingsItem(
                onTap: () {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.info,
                    animType: AnimType.rightSlide,
                    title: S.of(context).Sign_Out,
                    desc: S.of(context).are_you_sure_you_want_to_sign_out,
                    btnOkText: S.of(context).Yes,
                    btnCancelText: S.of(context).Cancel,
                    btnCancelOnPress: () {},
                    btnOkOnPress: () async {
                      await CacheNetwork.deleteFromCache();
                      token = CacheNetwork.getFromCache(key: 'token');

                      Navigator.pushNamedAndRemoveUntil(
                          context, Routes.signIn, (route) => false);
                      print(token);
                    },
                  ).show();
                },
                icons: Icons.exit_to_app_rounded,
                title: S.of(context).Sign_Out,
                titleStyle: AppStyles.font15Bold.copyWith(color: Colors.red)),
          ],
        ),
      ],
    );
  }
}
