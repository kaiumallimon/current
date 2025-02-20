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
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(13),
      border: Border.all(
        color: theme.primary.withOpacity(.2),
        width: 1,
      ),
      boxShadow: [
        BoxShadow(
          color: theme.primary.withOpacity(.1),
          blurRadius: 10,
          spreadRadius: 5,
          offset: Offset(0, 0),
        ),
      ],
    ),
    child: Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: buildNavigationItem(
                theme, AppAssets.home, 0, controller.currentIndex.value),
          ),
          Expanded(
            child: buildNavigationItem(
                theme, AppAssets.categories, 1, controller.currentIndex.value),
          ),
          Expanded(
            child: buildCenteredAddButton(theme, controller.currentIndex.value),
          ),
          Expanded(
            child: buildNavigationItem(
                theme, AppAssets.chat, 3, controller.currentIndex.value),
          ),
          Expanded(
            child: buildNavigationItem(
                theme, AppAssets.account, 4, controller.currentIndex.value),
          ),
        ],
      ),
    ),
  ).frosted(
    blur: 10,
    borderRadius: BorderRadius.circular(13),
  );
}

Widget buildNavigationItem(
    ColorScheme theme, String asset, int index, int selectedIndex) {
  return GestureDetector(
    onTap: () => Get.find<NavigationController>().updateIndex(index),
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.all(10),
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

Widget buildCenteredAddButton(ColorScheme theme, int selectedIndex) {
  return GestureDetector(
    onTap: () => Get.find<NavigationController>().updateIndex(2),
    child: Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: theme.primary,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: theme.primary.withOpacity(.3),
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: SvgPicture.asset(
        AppAssets.add,
        color: theme.onPrimary,
        width: 25,
        height: 25,
      ),
    ),
  );
}
