import 'package:current/app/core/constants/_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getLightTheme() => ThemeData(
    fontFamily: "Urbanist",
    colorScheme: ColorScheme.light(
      primary: AppColor.primary,
      secondary: AppColor.secondary,
      surface: AppColor.lightSurface,
      error: AppColor.error,
      onPrimary: AppColor.onPrimary,
      onSecondary: AppColor.onSecondary,
      onSurface: AppColor.onLightSurface,
      onError: AppColor.onPrimary,
    )
  );


  ThemeData getDarkTheme() => ThemeData(
    fontFamily: "Urbanist",
    colorScheme: ColorScheme.dark(
      primary: AppColor.primary,
      secondary: AppColor.secondary,
      surface: AppColor.darkSurface,
      error: AppColor.error,
      onPrimary: AppColor.onPrimary,
      onSecondary: AppColor.onSecondary,
      onSurface: AppColor.onDarkSurface,
      onError: AppColor.onPrimary,
    )
  );

}
