import 'package:current/app/modules/auth/view/_login_view.dart';
import 'package:current/app/modules/auth/view/_signup_view.dart';
import 'package:current/app/modules/dashboard_wrapper/view/_dashboard_wrapper.dart';
import 'package:current/app/modules/products/_product_view.dart';
// import 'package:go_router/go_router.dart';

import '../../modules/account/view/_account_view.dart';
import '../../modules/add/view/_add_to_cart_view.dart';
import '../../modules/categories/view/_categories_view.dart';
import '../../modules/chat/view/_chat_view.dart';
import '../../modules/home/view/_home_view.dart';
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

    // dashboard
    GetPage(name: '/dashboard', page: () => DashboardWrapper()),

    // home
    GetPage(name: '/home', page: () => HomeView(), children: [
      GetPage(name: '/product/:id', page: () => ProductView()),
    ]),

    // category
    GetPage(name: '/categories', page: () => CategoriesView()),

    // add to cart
    GetPage(name: '/add-to-cart', page: () => AddToCartView()),

    // chat
    GetPage(name: '/chat', page: () => ChatView()),

    //account
    GetPage(name: '/account', page: () => AccountView()),
  ];
}
