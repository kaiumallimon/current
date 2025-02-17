import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:current/app/data/repositories/auth/_login_repository.dart';
import 'package:current/app/core/constants/_colors.dart';

class LoginController extends GetxController {
  var rememberMe = false.obs;
  var isLoading = false.obs;

  final LoginRepository _loginRepository = Get.put(LoginRepository());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void onRememberMeChanged(bool value) {
    rememberMe.value = value;
  }

  void goToSignUp() {
    if (!isLoading.value) Get.toNamed('/signup');
  }

  Future<void> login() async {
    if (isLoading.value) return; // Prevent multiple requests
    isLoading.value = true;

    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      showSnackbar('Error', 'Email and password are required', true);
      isLoading.value = false;
      return;
    }

    showLoadingDialog();

    try {
      Map<String, dynamic> response =
          await _loginRepository.loginWithEmailAndPassword(
        email: email,
        password: password,
      );

      hideLoadingDialog();
      showSnackbar(response['success'] ? 'Success' : 'Error',
          response['message'], !response['success']);

      if (response['success']) {
        Get.offAllNamed('/dashboard'); // Navigate to home on success
      }
    } catch (e) {
      hideLoadingDialog();
      showSnackbar('Error', 'Something went wrong. Please try again.', true);
    } finally {
      isLoading.value = false;
    }
  }

  void showSnackbar(String title, String message, bool error) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: error ? Get.theme.colorScheme.error : AppColor.success,
      colorText: Colors.white,
      margin: const EdgeInsets.all(20),
    );
  }

  void showLoadingDialog() {
    Get.dialog(
      Center(
        child: LoadingAnimationWidget.twistingDots(
          leftDotColor: Get.theme.colorScheme.primary,
          rightDotColor: Get.theme.colorScheme.secondary,
          size: 30,
        ),
      ),
      barrierDismissible: false,
    );
  }

  void hideLoadingDialog() {
    if (Get.isDialogOpen ?? false) Get.back();
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

  void logout(){
    _loginRepository.logout();
    Get.offAllNamed('/login');
  }
}
