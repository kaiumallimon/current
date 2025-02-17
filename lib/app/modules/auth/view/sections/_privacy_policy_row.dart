import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/_sizes.dart';
import '../../../../core/constants/_strings.dart';
import '../../controller/_register_controller.dart';

Widget buildPrivacyPolicyRow(ColorScheme theme) {
  return Row(
    children: [
      GetX<RegisterController>(builder: (controller) {
        return Checkbox(
            side: BorderSide(color: theme.onSurface.withOpacity(.7)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            value: controller.privacyPolicy.value,
            onChanged: (value) {
              controller.privacyPolicy.toggle();
            });
      }),
      Text(AppString.agree,
          style: TextStyle(
              color: theme.onSurface.withOpacity(.7),
              fontSize: AppSize.fontRegular)),
    ],
  );
}
