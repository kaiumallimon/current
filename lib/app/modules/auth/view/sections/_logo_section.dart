import 'package:flutter/material.dart';

import '../../../../core/widgets/_app_logo.dart';

// ignore: non_constant_identifier_names
SizedBox auth_logo_section(Size size) {
  return SizedBox(
    height: size.height * .20,
    child: Center(
      child: AppLogo(),
    ),
  );
}
