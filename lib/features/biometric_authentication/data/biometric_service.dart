import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthApi {
  static final _auth = LocalAuthentication();
  static Future<bool> hasBiometrics() async {
    try {
      return await _auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      return false;
    }
  }

  static Future<List<BiometricType>> getBiometrics() async {
    try {
      return await _auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      return <BiometricType>[];
    }
  }

  static Future<bool> authenticate() async {
    final isAvailable = await hasBiometrics();
    // the result if having biometric authentication or not
    if (!isAvailable) return false;

    try {
      return await _auth.authenticate(
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
        ),
        localizedReason: 'Scan Fingerprint to Authenticate',
      );
    } on PlatformException catch (e) {
      return false;
    }
  }

  static Future<bool> biometricAuthMethod() async {
    final authPremission = await LocalAuthApi.hasBiometrics();
    final biometrics = await LocalAuthApi.getBiometrics();
    final authenticate = await LocalAuthApi.authenticate();
    if (authPremission && biometrics.contains(BiometricType.fingerprint) ||
        biometrics.contains(BiometricType.face)) {
      if (authenticate) {
        return true;
      }
      return false;
    }
    return false;
  }
}
