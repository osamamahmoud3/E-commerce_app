import 'package:flutter/material.dart';

import '../widgets/intro_screen_body.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: IntroScreenBody());
  }
}
