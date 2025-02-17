import 'package:flutter/material.dart';

import '../../../../core/constants/_sizes.dart';
import '../../../../core/constants/_strings.dart';

Row registerText(ColorScheme theme) {
  return Row(
    children: [
      Text(AppString.signup,
          textAlign: TextAlign.start,
          style: TextStyle(
              height: 1.1,
              fontSize: AppSize.fontLarge,
              fontWeight: FontWeight.w600,
              color: theme.onSurface)),
    ],
  );
}
