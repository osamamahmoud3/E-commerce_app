import 'package:ecommerce/core/styles/app_styles.dart';
import 'package:flutter/material.dart';

import 'exit_icon.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key, required this.tilte, required this.subTitile});
  final String tilte;
  final String subTitile;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            tilte,
            style: AppStyles.font21Bold,
          ),
          subtitle: Text(
            subTitile,
            style: AppStyles.font17Medium,
          ),
          trailing: const ExitIcon(),
        ),
        const SizedBox(
          height: 20,
        ),
        Image.asset('assets/images/auth_header_image.png')
      ],
    );
  }
}
