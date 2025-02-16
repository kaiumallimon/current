import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var rememberMe = false.obs;

  void onRememberMeChanged(bool value) {
    rememberMe.value = value;
  }

  void showWarningDialog(String text, String title) {
    Get.defaultDialog(
      title: title,
      middleText: text,
      textConfirm: 'OK',
      backgroundColor: Get.theme.colorScheme.onSurface,
      titleStyle: TextStyle(color: Get.theme.colorScheme.primary),
      middleTextStyle: TextStyle(color: Get.theme.colorScheme.surface),
      barrierDismissible: false,
      buttonColor: Get.theme.colorScheme.primary,
      contentPadding: EdgeInsets.all(20),
      onConfirm: () {
        Get.back();
      },
    );
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
}
