import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';
import '../widgets/address_screen_body.dart';

class AdressScreen extends StatelessWidget {
  const AdressScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0XFFF1EFEF),
        title: Text(S.of(context).Address_Book),
      ),
      body: const AddressScreenBody(),
    );
  }
}
