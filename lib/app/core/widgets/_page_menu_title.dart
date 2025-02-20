
import 'package:flutter/material.dart';

import '../constants/_strings.dart';

class PageMenuTitle extends StatelessWidget {
  const PageMenuTitle({
    super.key,
    required this.theme,
  });

  final ColorScheme theme;

  @override
  Widget build(BuildContext context) {
    return Text(AppString.myOrders,
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: theme.primary));
  }
}
