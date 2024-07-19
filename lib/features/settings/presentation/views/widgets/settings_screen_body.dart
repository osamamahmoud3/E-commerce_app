import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/styles/app_styles.dart';
import '../../../../../generated/l10n.dart';
import 'settings_body.dart';
import 'settings_user_card.dart';

class SettingsScreenBody extends StatelessWidget {
  const SettingsScreenBody({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(17),
      child: ListView(
        children: [
          const SizedBox(
            height: 12,
          ),
          Text(
            S.of(context).Settings,
            style: AppStyles.font25Bold,
          ),
          const SizedBox(
            height: 12,
          ),
          // User card
          const SettingsUserCard(),

          // body
          const SettingsBody(),
        ],
      ),
    );
  }
}
