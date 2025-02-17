import 'package:current/app/modules/splash/controller/_splash_controller.dart';
import 'package:get/get.dart';

import '../../modules/auth/controller/_login_controller.dart';
import '../../modules/auth/controller/_register_controller.dart';
import '../../modules/privacy_policy/controller/_privacy_policy_controller.dart';
import '../extra/_lifecycle_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LifecycleController());

    Get.lazyPut<SplashController>(() => SplashController());

    Get.lazyPut<LoginController>(() => LoginController());

    Get.put<RegisterController>(RegisterController());

    Get.put<PrivacyPolicyController>(PrivacyPolicyController());
  }
}
