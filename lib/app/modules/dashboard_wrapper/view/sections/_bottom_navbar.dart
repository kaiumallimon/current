import 'package:blur/blur.dart';
import 'package:current/app/core/constants/_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../controller/_navigation_controller.dart';

Widget buildCustomBottomNavbar(BuildContext context, ColorScheme theme) {
  final controller = Get.find<NavigationController>();
  return Container(
    width: 320,
    height: 65,
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(13), boxShadow: [
      BoxShadow(
        color: theme.primary.withOpacity(.1),
        blurRadius: 10,
        spreadRadius: 5,
        offset: Offset(0, 0),
      )
    ]),
    child: Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNavigationItem(theme, AppAssets.home, 0,
                controller.currentIndex.value, 'Home'),
            buildNavigationItem(theme, AppAssets.categories, 1,
                controller.currentIndex.value, 'Categories'),
            buildNavigationItem(
                theme, AppAssets.add, 2, controller.currentIndex.value, 'Add'),
            buildNavigationItem(theme, AppAssets.chat, 3,
                controller.currentIndex.value, 'Chat'),
            buildNavigationItem(theme, AppAssets.account, 4,
                controller.currentIndex.value, 'Account'),
          ],
        )),
  ).frosted(
    blur: 10,
    borderRadius: BorderRadius.circular(13),
  );
}

Widget buildNavigationItem(ColorScheme theme, String asset, int index,
    int selectedIndex, String label) {
  return GestureDetector(
    onTap: () {
      Get.find<NavigationController>().updateIndex(index);

      // Get.offNamed(_getRoute(index));
    },
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: index == 2
          ? const EdgeInsets.symmetric(horizontal: 20, vertical: 10)
          : const EdgeInsets.all(10),
      decoration: index == 2
          ? BoxDecoration(
              color: theme.primary,
              borderRadius: BorderRadius.circular(13),
            )
          : null,
      child: TweenAnimationBuilder<Color?>(
        tween: ColorTween(
          begin: index == selectedIndex
              ? theme.onSurface.withOpacity(.7)
              : theme.primary,
          end: index == selectedIndex
              ? theme.primary
              : theme.onSurface.withOpacity(.7),
        ),
        duration: const Duration(milliseconds: 300),
        builder: (context, color, child) {
          return SvgPicture.asset(
            asset,
            color: color,
            width: 25,
            height: 25,
          );
        },
      ),
    ),
  );
}
