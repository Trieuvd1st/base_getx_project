import 'package:base_getx_project/ui/splash/splash_page.dart';
import 'package:get/get.dart';

class Routes {
  static const splash = '/splash';
  static const login = '/login';
  static const home = '/home';
}

final List<GetPage> route = [
  GetPage(name: Routes.splash, page: () => SplashPage()),
];