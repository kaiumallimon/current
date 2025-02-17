import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/_privacy_policy_view.dart';

class PrivacyPolicyController extends GetxController {
  void showPrivacyModalSheet(BuildContext context, ColorScheme theme) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: theme.surface,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return const PrivacyPolicyView();
      },
    );
  }
}
