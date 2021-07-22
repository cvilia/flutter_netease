import 'package:flutter_netease/page/launcher_page.dart';
import 'package:flutter_netease/page/login_page.dart';
import 'package:flutter_netease/page/main/discovery/discovery_page.dart';
import 'package:flutter_netease/page/main/main_page.dart';
import 'package:get/get.dart';

class AppPages {
  static const String INITIAL = Routes.LAUNCHER;

  static List<GetPage> routes = [
    GetPage(name: Routes.LAUNCHER, page: () => LauncherPage()),
    GetPage(name: Routes.MAIN, page: () => MainPage()),
    GetPage(name: Routes.LOGIN, page: () => LoginPage()),
    GetPage(name: Routes.DISCOVERY, page: () => DiscoveryPage()),
  ];
}

abstract class Routes {
  static const String LAUNCHER = '/launcher';
  static const String MAIN = '/main';
  static const String LOGIN = '/login';
  static const String DISCOVERY = '/discovery';
}
