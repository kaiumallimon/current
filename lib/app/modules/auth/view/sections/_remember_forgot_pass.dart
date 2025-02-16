import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/_strings.dart';
import '../../controller/_login_controller.dart';

Widget buildRememberMeForgotPasswordRow(ColorScheme theme) {
  
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          GetX<LoginController>(builder: (controller) {
            return Checkbox(
              value: controller.rememberMe.value,
              onChanged: (value) {
                controller.onRememberMeChanged(value!);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              side: BorderSide(
                color: theme.onSurface.withOpacity(.5),
                width: 1,
              ),
              activeColor: theme.primary,
            );
          }),
          Text(AppString.remember, style: TextStyle(color: theme.onSurface)),
        ],
      ),
      Text(AppString.forgot,
          style: TextStyle(color: theme.error, fontWeight: FontWeight.w600)),
    ],
  );
}
