import 'file:///F:/flutter_project/flutter_netease/lib/page/home/home_page.dart';
import 'package:flutter_netease/page/launcher_page.dart';
import 'package:get/get.dart';

class AppPages {
  static const String INITIAL = Routes.LAUNCHER;

  static List<GetPage> routes = [
    GetPage(name: INITIAL, page: ()=>LauncherPage()),
    GetPage(name: Routes.HOME, page: ()=>HomePage()),
  ];
}

abstract class Routes {
  static const String LAUNCHER = "/launcher";
  static const String HOME = "-home";
}
