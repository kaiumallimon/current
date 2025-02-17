import 'package:current/app/modules/auth/controller/_register_controller.dart';
import 'package:current/app/modules/auth/view/sections/_register_subtitle.dart';
import 'package:current/app/modules/auth/view/sections/_register_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/_assets.dart';
import '../../../core/constants/_sizes.dart';
import '../../../core/constants/_strings.dart';
import '../../../core/widgets/_custom_divider.dart';
import '../../../core/widgets/_custom_labeled_textfield.dart';
import '../../../core/widgets/_custom_svg_button.dart';
import '../../../core/widgets/_gradient_bg.dart';
import '../controller/_login_controller.dart';
import 'sections/_logo_section.dart';
import 'sections/_privacy_policy_row.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    // get theme
    final theme = Theme.of(context).colorScheme;

    // get size
    final size = MediaQuery.of(context).size;

    final controller = Get.find<RegisterController>();

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: theme.surface,
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            CustomBackgroundGradient(),
            SafeArea(
                child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSize.paddingSide, vertical: 25),
              physics: BouncingScrollPhysics(),
              child: Column(
                spacing: 8,
                children: [
                  // Logo section
                  auth_logo_section(size),

                  // login form section
                  registerText(theme),
                  // login subtitle text
                  registerSubtitle(theme),

                  const SizedBox(height: 8),

                  // social login buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomSvgButton(
                        text: AppString.google,
                        color: theme.surface,
                        textColor: theme.onSurface,
                        asset: AppAssets.google,
                        onPressed: () {
                          Get.find<LoginController>().showWarningDialog(
                              AppString.unavailableFeature, AppString.warning);
                        },
                      ),
                      CustomSvgButton(
                        text: AppString.facebook,
                        color: theme.surface,
                        textColor: theme.onSurface,
                        asset: AppAssets.facebook,
                        onPressed: () {
                          Get.find<LoginController>().showWarningDialog(
                              AppString.unavailableFeature, AppString.warning);
                        },
                      ),
                    ],
                  ),
                  // or
                  Row(
                    spacing: 15,
                    children: [
                      Expanded(child: CustomDivider()),
                      Text('or',
                          style: TextStyle(
                              color: theme.onSurface.withOpacity(.7))),
                      Expanded(child: CustomDivider()),
                    ],
                  ),

                  const SizedBox(height: 10),

                  GetBuilder<RegisterController>(builder: (loginController) {
                    return CustomLabeledTextField(
                      label: AppString.name,
                      hint: AppString.nameHint,
                      controller: loginController.nameController,
                      obscureText: false,
                      keyboardType: TextInputType.name,
                      width: 400,
                      height: AppSize.inputHeight,
                    );
                  }),

                  // email and password fields
                  GetBuilder<RegisterController>(builder: (loginController) {
                    return CustomLabeledTextField(
                      label: AppString.email,
                      hint: AppString.emailHint,
                      controller: loginController.emailController,
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                      width: 400,
                      height: AppSize.inputHeight,
                    );
                  }),

                  GetBuilder<RegisterController>(builder: (loginController) {
                    return CustomLabeledTextField(
                      label: AppString.password,
                      hint: AppString.passwordHint,
                      controller: loginController.passwordController,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      width: 400,
                      height: AppSize.inputHeight,
                    );
                  }),

                  // privacy policy
                  buildPrivacyPolicyRow(theme),

                  CustomButton(
                      theme: theme,
                      width: 400,
                      height: AppSize.buttonHeight,
                      text: AppString.signup,
                      onPressed: () async{
                      await controller.register();
                      }),

                  const SizedBox(height: 5),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 8,
                    children: [
                      Text(AppString.noAccount,
                          style: TextStyle(
                              color: theme.onSurface.withOpacity(.8))),
                      GestureDetector(
                        onTap: () {
                          controller.goToLogin();
                        },
                        child: Text(AppString.login,
                            style: TextStyle(
                                color: theme.onSurface,
                                fontWeight: FontWeight.w700)),
                      ),
                    ],
                  )
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.theme,
    required this.width,
    required this.height,
    required this.onPressed,
    required this.text,
  });

  final ColorScheme theme;
  final double width;
  final double height;
  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: theme.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: theme.surface,
                  fontWeight: FontWeight.w500,
                  fontSize: 16)),
        ),
      ),
    );
  }
}
