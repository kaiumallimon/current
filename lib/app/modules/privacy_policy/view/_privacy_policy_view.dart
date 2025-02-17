import 'package:current/app/core/constants/_privacy_policy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../../core/widgets/_custom_markdown_style.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    // get theme
    final theme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // indicator
          Center(
            child: Container(
              width: 80,
              height: 5,
              decoration: BoxDecoration(
                color: theme.onSurface.withOpacity(0.3),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),

          const SizedBox(height: 15),

          // markdown
          Expanded(
              child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: MarkdownBody(
                      data: PrivacyPolicyString.policyMarkdown,
                      styleSheet: customMarkdownStyle(theme)))),
        ],
      ),
    );
  }
}
