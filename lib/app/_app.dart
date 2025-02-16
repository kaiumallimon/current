import 'package:current/app/core/bindings/_app_bindings.dart';
import 'package:current/app/core/routes/_app_route.dart';
import 'package:current/app/core/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurrentApp extends StatelessWidget {
  const CurrentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // routeInformationProvider: AppRoute().router.routeInformationProvider,
      // routerDelegate: AppRoute().router.routerDelegate,
      // routeInformationParser: AppRoute().router.routeInformationParser,

      debugShowCheckedModeBanner: false,
      theme: AppTheme().getLightTheme(),
      initialBinding: AppBindings(),
      initialRoute: '/',
      getPages: AppRoute().getPages,
    );
  }
}
