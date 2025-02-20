import 'package:current/app/core/constants/_colors.dart';
import 'package:current/app/core/constants/_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/constants/_assets.dart';
import '../../../core/widgets/_custom_page_title.dart';
import '../../../core/widgets/_custom_tile.dart';
import '../../../core/widgets/_page_menu_title.dart';
import '../controller/_account_controller.dart';
import 'parts/_profile_data.dart';
import 'parts/_profile_image.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    // get theme:
    final theme = Theme.of(context).colorScheme;
    final statusbarHeight = MediaQuery.of(context).padding.top;

    final controller = Get.find<AccountController>();

    return Container(
      margin: EdgeInsets.only(top: statusbarHeight),
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // appbar
          customPageTitle(AppString.accountString),
          // body
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  // profile info [name, email, points]
                  Container(
                    decoration: BoxDecoration(
                      // color: theme.primary,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: theme.primary.withOpacity(.2), width: 1),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        // profile image
                        accountProfileImage(theme),
                        const SizedBox(width: 15),
                        // profile data
                        accountProfileData(controller, theme),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  //order data
                  Column(
                    spacing: 15,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PageMenuTitle(theme: theme),
                      CustomTile(
                          theme: theme,
                          title: AppString.allOrders,
                          leading: AppAssets.allOrders,
                          leadingColor: theme.secondary,
                          onTap: () {}),
                      CustomTile(
                          theme: theme,
                          title: AppString.processingOrders,
                          leading: AppAssets.processingOrders,
                          leadingColor: AppColor.extra,
                          onTap: () {}),
                      CustomTile(
                          theme: theme,
                          title: AppString.delivered,
                          leading: AppAssets.delivered,
                          leadingColor: AppColor.success,
                          onTap: () {}),
                      CustomTile(
                          theme: theme,
                          title: AppString.returned,
                          leading: AppAssets.returned,
                          leadingColor: theme.error,
                          onTap: () {}),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
