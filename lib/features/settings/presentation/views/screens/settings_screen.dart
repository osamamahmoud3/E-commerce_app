import 'package:ecommerce/features/settings/presentation/views/widgets/settings_screen_body.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SettingsScreenBody(),
    );
  }
}
