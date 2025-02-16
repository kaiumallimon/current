import 'package:flutter/material.dart';

import '../../../../core/constants/_sizes.dart';
import '../../../../core/constants/_strings.dart';

Row loginSubtitle(ColorScheme theme) {
  return Row(
    children: [
      Text(AppString.loginSubtitle,
          textAlign: TextAlign.start,
          style: TextStyle(
              fontSize: AppSize.fontRegular,
              color: theme.onSurface.withOpacity(.7))),
    ],
  );
}
