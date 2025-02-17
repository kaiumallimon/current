import 'package:current/app/modules/auth/controller/_login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardWrapper extends StatelessWidget {
  const DashboardWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ElevatedButton(
              onPressed: () {
                Get.find<LoginController>().logout();
              },
              child: Text('Logout')),
        ),
      ),
    );
  }
}
