import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:current/app/data/models/home/_category_model.dart';

import '../../../core/constants/_colors.dart';
import '../../../data/repositories/home/_home_repository.dart';

class HomeController extends GetxController {
  var isCategoryLoading = false.obs;
  var categories = <CategoryModel>[].obs; // Correct RxList type

  final HomeRepository _repository = HomeRepository();

  void fetchCategories() async {
    try {
      isCategoryLoading.value = true; // Start loading
      var fetchedCategories = await _repository.getCategories();
      categories.assignAll(fetchedCategories);
    } catch (e) {
      showSnackbar('Error', e.toString(), true);
    } finally {
      isCategoryLoading.value = false; // Stop loading
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

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }
}
