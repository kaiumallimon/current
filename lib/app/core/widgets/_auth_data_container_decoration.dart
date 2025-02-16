import 'package:flutter/material.dart';

BoxDecoration authDataContainerDecoration(ColorScheme theme) {
  return BoxDecoration(
    color: theme.surface,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(30),
      topRight: Radius.circular(30),
    ),
  );
}
