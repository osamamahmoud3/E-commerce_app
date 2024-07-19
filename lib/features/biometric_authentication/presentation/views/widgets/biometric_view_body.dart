import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

import '../../../data/biometric_service.dart';

class BiometricAuthViewBody extends StatefulWidget {
  const BiometricAuthViewBody({super.key, required this.pageRoute});
  final String pageRoute;
  @override
  State<BiometricAuthViewBody> createState() => _BiometricAuthViewBodyState();
}

class _BiometricAuthViewBodyState extends State<BiometricAuthViewBody> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethid(pageRoute: widget.pageRoute);
    });

    super.initState();
  }

  _asyncMethid({required String pageRoute}) async {
    final authPremission = await LocalAuthApi.hasBiometrics();
    final biometrics = await LocalAuthApi.getBiometrics();
    final authenticate = await LocalAuthApi.authenticate();
    if (authPremission && biometrics.contains(BiometricType.fingerprint) ||
        biometrics.contains(BiometricType.face)) {
      if (authenticate) {
        if (mounted) {
          Navigator.pushReplacementNamed(context, pageRoute);
        }
      }
    } else {
      if (mounted) {
        Navigator.pushReplacementNamed(context, pageRoute);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
