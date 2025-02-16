import 'package:current/app/modules/auth/view/_login_view.dart';
import 'package:current/app/modules/auth/view/_signup_view.dart';
// import 'package:go_router/go_router.dart';

import '../../modules/splash/view/splash_view.dart';

import 'package:get/get.dart';

class AppRoute {
  // final GoRouter router = GoRouter(initialLocation: '/', routes: [
  //   // splash
  //   GoRoute(path: '/', builder: (context, state) => SplashView()),

  //   // login
  //   GoRoute(path: '/login', builder: (context, state) => LoginView()),

  //   // signup
  //   GoRoute(path: '/signup', builder: (context, state) => SignupView()),
  // ]);


  final List<GetPage> getPages = [
    // splash
    GetPage(name: '/', page: () => SplashView()),

    // login
    GetPage(name: '/login', page: () => LoginView()),

    // signup
    GetPage(name: '/signup', page: () => SignupView()),
  ];
}
