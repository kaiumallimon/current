import 'package:flutter/material.dart';

import '../../../../core/constants/_sizes.dart';
import '../../../../core/constants/_strings.dart';

Row loginText(ColorScheme theme) {
  return Row(
    children: [
      Text(AppString.login,
          textAlign: TextAlign.start,
          style: TextStyle(
              height: 1.1,
              fontSize: AppSize.fontLarge,
              fontWeight: FontWeight.w600,
              color: theme.onSurface)),
    ],
  );
}
