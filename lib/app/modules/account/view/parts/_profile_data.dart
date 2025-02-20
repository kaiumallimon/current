import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/_account_controller.dart';

Expanded accountProfileData(AccountController controller, ColorScheme theme) {
    return Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.userData['name'],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  controller.userData['email'],
                  style: TextStyle(
                    fontSize: 14,
                    color: theme.onSurface,
                  ),
                ),
              ],
            )),

        // points
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          decoration: BoxDecoration(
            color: theme.primary.withOpacity(.2),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text('10 points',
              style: TextStyle(
                fontSize: 14,
                color: theme.onSurface,
              )),
        ),
      ],
    ));
  }