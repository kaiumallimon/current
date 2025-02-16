import 'package:current/app/core/widgets/_gradient_bg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widgets/_app_logo.dart';
import '../controller/_splash_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<SplashController>();

    // go to next page:
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background gradient
          CustomBackgroundGradient(),

          // Logo
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Logo
                AppLogo(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
