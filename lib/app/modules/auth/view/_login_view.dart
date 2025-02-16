import 'package:current/app/core/constants/_assets.dart';
import 'package:current/app/core/constants/_strings.dart';
import 'package:current/app/core/widgets/_gradient_bg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/_sizes.dart';
import '../../../core/widgets/_auth_data_container_decoration.dart';
import '../../../core/widgets/_custom_divider.dart';
import '../../../core/widgets/_custom_labeled_textfield.dart';
import '../../../core/widgets/_custom_svg_button.dart';
import '../controller/_login_controller.dart';
import 'sections/_login_subtitle.dart';
import 'sections/_login_title.dart';
import 'sections/_logo_section.dart';
import 'sections/_remember_forgot_pass.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    // get theme
    final theme = Theme.of(context).colorScheme;

    // get size
    final size = MediaQuery.of(context).size;

    final controller = Get.find<LoginController>();

    return Scaffold(
      backgroundColor: theme.surface,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          CustomBackgroundGradient(),
          SafeArea(
              child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                // Logo section
                auth_logo_section(size),

                // login form section
                Container(
                  height: size.height * .75,
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSize.paddingSide, vertical: 25),
                  // decoration: authDataContainerDecoration(theme),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8,
                    children: [
                      // login title text
                      loginText(theme),
                      // login subtitle text
                      loginSubtitle(theme),

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
                              controller.showWarningDialog(
                                  AppString.unavailableFeature,
                                  AppString.warning);
                            },
                          ),
                          CustomSvgButton(
                            text: AppString.facebook,
                            color: theme.surface,
                            textColor: theme.onSurface,
                            asset: AppAssets.facebook,
                            onPressed: () {
                              controller.showWarningDialog(
                                  AppString.unavailableFeature,
                                  AppString.warning);
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

                      // email and password fields
                      GetBuilder<LoginController>(builder: (loginController) {
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

                      GetBuilder<LoginController>(builder: (loginController) {
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

                      // remember me and forgot password row
                      buildRememberMeForgotPasswordRow(theme),

                      Container(
                        height: AppSize.buttonHeight,
                        width: 400,
                        decoration: BoxDecoration(
                          color: theme.primary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(AppString.login,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: theme.surface,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16)),
                        ),
                      ),

                      const SizedBox(height: 5),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 5,
                        children: [
                          Text(AppString.noAccount,
                              style: TextStyle(
                                  color: theme.onSurface.withOpacity(.8))),
                          TextButton(
                            onPressed: () {
                              controller.showWarningDialog(
                                  AppString.unavailableFeature,
                                  AppString.warning);
                            },
                            child: Text(AppString.signup,
                                style: TextStyle(
                                    color: theme.primary,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
        ],
      ),
    );
  }
}
