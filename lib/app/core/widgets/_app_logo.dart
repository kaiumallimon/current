
import 'package:flutter/material.dart';

import '../constants/_assets.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.logo,
      fit: BoxFit.contain,
      width: 200,
      height: 200,
    );
  }
}
