import 'package:blur/blur.dart';
import 'package:current/app/core/widgets/_gradient_bg.dart';
import 'package:current/app/modules/auth/controller/_login_controller.dart';
import 'package:current/app/modules/dashboard_wrapper/view/sections/_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../home/view/_home_view.dart';
import '../../categories/view/_categories_view.dart';
import '../../add/view/_add_to_cart_view.dart';
import '../../chat/view/_chat_view.dart';
import '../../account/view/_account_view.dart';
import '../controller/_navigation_controller.dart';

class DashboardWrapper extends StatelessWidget {
  const DashboardWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final NavigationController navController = Get.find<NavigationController>();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: theme.brightness,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: theme.brightness,
    ));

    return Scaffold(
      backgroundColor: theme.primary,
      body: Stack(
        fit: StackFit.expand,
        children: [
          CustomBackgroundGradient().blurred(
            blur: 10,
          ),
          Navigator(
            key: Get.nestedKey(1), // Nested Navigation
            onGenerateRoute: (settings) {
              return MaterialPageRoute(
                builder: (_) => Obx(() {
                  return _getPage(navController.currentIndex.value);
                }),
              );
            },
          ),
        ],
      ),
      floatingActionButton: buildCustomBottomNavbar(context, theme),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return const HomeView();
      case 1:
        return const CategoriesView();
      case 2:
        return const AddToCartView();
      case 3:
        return const ChatView();
      case 4:
        return const AccountView();
      default:
        return const HomeView();
    }
  }
}
