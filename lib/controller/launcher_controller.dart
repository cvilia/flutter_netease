import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_netease/config/constant.dart';
import 'package:flutter_netease/route/app_pages.dart';
import 'package:flutter_netease/util/sp_util.dart';
import 'package:flutter_netease/widget/message_button_dialog.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class LauncherController extends GetxController {
  Timer _timer;
  var count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) async {
      count.value++;
      if (count.value == 1) {
        timer.cancel();
        var permissionStatus = Permission.storage.request();

        if (await permissionStatus.isGranted) {
          await SpUtil.getBool(Constant.SP_USER_LOGIN)
              ? Get.offNamed(Routes.HOME)
              : Get.offNamed(Routes.LOGIN);
        } else if (await permissionStatus.isPermanentlyDenied) {
          Get.dialog(MessageButtonDialog(
            message: '气泡音乐即将跳转设置页面',
            onTap: () {
              Get.back();
              openAppSettings().then((value) async {
                if (await permissionStatus.isGranted) {
                  await SpUtil.getBool(Constant.SP_USER_LOGIN)
                      ? Get.offNamed(Routes.HOME)
                      : Get.offNamed(Routes.LOGIN);
                } else {
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                }
              });
            },
          ));
        } else {
          SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        }
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
    if (_timer.isActive) {
      _timer.cancel();
    }
  }
}