import 'package:diskominfo/page/login/login_binding.dart';
import 'package:diskominfo/page/login/login_view.dart';
import 'package:diskominfo/page/splash/splash_view.dart';
import 'package:get/get.dart';

class RouteApp {
  static const initial = SplashPage.route;

  static final routes = [
    // GetPage(
    //     name: NavigationView.route,
    //     transition: Transition.fadeIn,
    //     page: () => const NavigationView(),
    //     binding: NavigationBinding()),
    GetPage(
        name: SplashPage.route,
        transition: Transition.fadeIn,
        page: () => const SplashPage(),
        // binding: SplashBinding()
        ),
    GetPage(
        name: LoginView.route,
        transition: Transition.fadeIn,
        page: () => LoginView(),
        binding: LoginBinding()
        ),
  ];
}
