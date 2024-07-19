import 'package:flutter/material.dart';

import '../widgets/biometric_view_body.dart';

class BiometricAuthView extends StatelessWidget {
  const BiometricAuthView({super.key, required this.pageRoute});
  final String pageRoute;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BiometricAuthViewBody(
        pageRoute: pageRoute,
      ),
    );
  }
}
