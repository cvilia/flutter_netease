import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_netease/config/constant.dart';
import 'package:flutter_netease/route/app_pages.dart';
import 'package:flutter_netease/util/sp_util.dart';
import 'package:flutter_netease/widget/message_button_dialog.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class LauncherController extends GetxController {
  Timer? _timer;
  var count = 0.obs;
  var imgUrl = RxnString();

  @override
  void onInit() async {
    super.onInit();
    imgUrl.value = await SpUtil.getString(Constant.SP_LAUNCHER_IMG_URL);
    _timer = Timer.periodic(Duration(seconds: 1), (timer) async {
      count.value++;
      if (count.value == 1) {
        timer.cancel();
        var permissionStatus = Permission.storage.request();
        if (await permissionStatus.isGranted) {
          route2App();
        } else if (await permissionStatus.isPermanentlyDenied) {
          Get.dialog(MessageButtonDialog(
            message: '气泡音乐即将跳转设置页面',
            onTap: () {
              Get.back();
              openAppSettings().then((value) async {
                if (await permissionStatus.isGranted) {
                  route2App();
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

  void route2App() async {
    bool hasLogin = await SpUtil.getBool(Constant.SP_USER_LOGIN, false);
    if (hasLogin) {
      Get.offNamed(Routes.HOME);
    } else {
      Get.offNamed(Routes.LOGIN);
    }
  }

  @override
  void onClose() {
    super.onClose();
    if (_timer!.isActive) {
      _timer?.cancel();
    }
  }
}
