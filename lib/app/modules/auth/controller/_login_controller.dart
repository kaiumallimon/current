import 'package:get/get.dart';

class LoginController extends GetxController {
  var rememberMe = false.obs;

  void onRememberMeChanged(bool value) {
    rememberMe.value = value;
  }
}
