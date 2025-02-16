import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // get theme
    final theme = Theme.of(context).colorScheme;
    return Divider(
      color: theme.onSurface.withOpacity(.1),
      height: 1,
    );
  }
}
