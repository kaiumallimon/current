import 'package:get/get.dart';

import '../../../data/repositories/hive/_auth_opt.dart';

class AccountController extends GetxController {
  var userData = {}.obs;

  void fetchUserData() async {
    final user = await AuthOptions().getSession();
    userData.value = user!;
  }

  @override
  void onInit() {
    fetchUserData();
    super.onInit();
  }
}
