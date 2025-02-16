import 'package:blur/blur.dart';
import 'package:flutter/material.dart';

class CustomBackgroundGradient extends StatelessWidget {
  const CustomBackgroundGradient({super.key});

  @override
  Widget build(BuildContext context) {
    // get theme:
    final theme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          // stops: [0.1, 0.3, 0.5, 0.9],
          colors: [
            theme.primary.withOpacity(.4),
            theme.surface,
            theme.surface,
            theme.primary.withOpacity(.4),
          ],
        ),
      ),
    ).blurred(blur: 100);
  }
}
