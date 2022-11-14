import 'package:get/get.dart';
import 'package:testmedicalapp/view/screen/splash_screen.dart';

class RouteHelper {
  static const String initial = "/";
  static const String splash = "/splash";

  //
  static String getInitialRoute() => initial;
  static String getSplashRoute() => splash;

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const SplashScreen()),
    GetPage(name: splash, page: () => const SplashScreen()),
  ];
}