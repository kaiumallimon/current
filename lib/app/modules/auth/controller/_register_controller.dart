import 'package:current/app/core/constants/_colors.dart';
import 'package:current/app/data/repositories/auth/_register_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class RegisterController extends GetxController {
  var privacyPolicy = false.obs;
  var isLoading = false.obs;

  final RegisterRepository _registerRepository = Get.put(RegisterRepository());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  void togglePrivacyPolicy() {
    privacyPolicy.toggle();
  }

  void goToLogin() {
    if (!isLoading.value) Get.back();
  }

  Future<void> register() async {
    if (isLoading.value) return; // Prevent multiple clicks
    isLoading.value = true;

    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();
    final String name = nameController.text.trim();

    if (email.isEmpty || password.isEmpty || name.isEmpty) {
      showSnackbar('Error', 'All fields are required', true);
      isLoading.value = false;
      return;
    }

    if (!privacyPolicy.value) {
      showSnackbar('Error', 'You must accept the privacy policy', true);
      isLoading.value = false;
      return;
    }

    showLoadingDialog();

    try {
      Map<String, dynamic> response =
          await _registerRepository.registerWithEmailAndPassword(
        email: email,
        password: password,
        name: name,
      );

      hideLoadingDialog();
      showSnackbar(response['success'] ? 'Success' : 'Error',
          response['message'], !response['success']);

      if (response['success']!) {
        // clear
        emailController.clear();
        passwordController.clear();
        nameController.clear();

        Get.offNamed('/login');
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
}
