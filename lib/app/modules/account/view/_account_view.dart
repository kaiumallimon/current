import 'package:current/app/core/constants/_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/_assets.dart';
import '../controller/_account_controller.dart';

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppString.accountString,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          // body
          Expanded(
            child: SingleChildScrollView(
              child: Column(
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
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            AppAssets.userPlaceholder,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 15),

                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 8,
                          children: [
                            Obx(() => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.userData['name'],
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      controller.userData['email'],
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: theme.onSurface,
                                      ),
                                    ),
                                  ],
                                )),

                            // points
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: theme.primary.withOpacity(.2),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text('10 points',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: theme.onSurface,
                                  )),
                            ),
                          ],
                        ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
