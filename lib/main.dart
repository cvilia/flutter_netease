import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_netease/route/app_pages.dart';
import 'package:get/get.dart';

void main() {
  HttpOverrides.global = DetourHttps();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        splashColor: Color.fromRGBO(0, 0, 0, 0),
        platform: TargetPlatform.iOS
      ),
    ),
  );
  if (Platform.isAndroid) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    ///隐藏手机底部的导航条
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    SystemUiOverlayStyle dark =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark);
    SystemChrome.setSystemUIOverlayStyle(dark);
  }
}

///绕过https验证
class DetourHttps extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    // TODO: implement createHttpClient
    return super.createHttpClient(context)..badCertificateCallback = (_, __, ___) => true;
  }
}
