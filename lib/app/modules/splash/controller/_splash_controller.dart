import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 1), goNext);
  }

  void goNext() {
    // check if logged in
    isLoggedIn().then((value) {
      if (value) {
        Get.offNamed('/dashboard');
      } else {
        Get.offNamed('/login');
      }
    });
  }

  // check if logged in
  Future<bool> isLoggedIn() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final User? user = _auth.currentUser;
    return user != null;
  }
}
