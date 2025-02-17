import 'package:current/app/modules/auth/controller/_login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LifecycleController extends GetxController with WidgetsBindingObserver {
  @override
  void onInit() {
    WidgetsBinding.instance.addObserver(this);
    super.onInit();
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.detached) {
      logoutUser();
    }
  }

  /// Logs out the user by clearing Hive storage
  void logoutUser() async {
    var box = await Hive.openBox('authBox');
    bool hasUser = box.containsKey('user');

    if (!hasUser) {
      await box.clear(); 
      Get.find<LoginController>().logout();
    }
  }
}