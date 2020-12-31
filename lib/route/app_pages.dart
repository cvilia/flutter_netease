import 'package:flutter_netease/page/home/play/play_page.dart';
import 'package:flutter_netease/page/launcher_page.dart';
import 'package:flutter_netease/page/login_page.dart';
import 'package:get/get.dart';
import '../page/home/home_page.dart';

class AppPages {
  static const String INITIAL = Routes.LAUNCHER;

  static List<GetPage> routes = [
    GetPage(name: INITIAL, page: ()=>LauncherPage()),
    GetPage(name: Routes.HOME, page: ()=>HomePage()),
    GetPage(name: Routes.LOGIN, page: ()=>LoginPage()),
    GetPage(name: Routes.PLAY_PAGE, page: ()=>PlayPage()),
  ];
}

abstract class Routes {
  static const String LAUNCHER = '/launcher';
  static const String HOME = '-home';
  static const String LOGIN = '-login';
  static const String PLAY_PAGE = '-playpage';
}
