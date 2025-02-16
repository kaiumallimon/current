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

    return Scaffold(
      backgroundColor: theme.surface,
      body: Stack(
        children: [
          CustomBackgroundGradient(),
          SafeArea(
              child: Column(
            children: [
              // Logo section
              auth_logo_section(size),

              // login form section
              Expanded(
                  child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSize.paddingSide, vertical: 25),
                decoration: authDataContainerDecoration(theme),
                child: SingleChildScrollView(
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
                            onPressed: () {},
                          ),
                          CustomSvgButton(
                            text: AppString.facebook,
                            color: theme.surface,
                            textColor: theme.onSurface,
                            asset: AppAssets.facebook,
                            onPressed: () {},
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
                      CustomLabeledTextField(
                        label: AppString.email,
                        hint: AppString.emailHint,
                        controller: TextEditingController(),
                        obscureText: false,
                        keyboardType: TextInputType.emailAddress,
                        width: 400,
                        height: AppSize.inputHeight,
                      ),

                      CustomLabeledTextField(
                        label: AppString.password,
                        hint: AppString.passwordHint,
                        controller: TextEditingController(),
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        width: 400,
                        height: AppSize.inputHeight,
                      ),

                      // remember me and forgot password row
                      buildRememberMeForgotPasswordRow(theme),
                    ],
                  ),
                ),
              ))
            ],
          )),
        ],
      ),
    );
  }
}
