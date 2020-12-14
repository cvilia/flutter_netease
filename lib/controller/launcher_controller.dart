import 'dart:async';

import 'package:flutter_netease/config/constant.dart';
import 'package:flutter_netease/route/app_pages.dart';
import 'package:flutter_netease/util/sp_util.dart';
import 'package:get/get.dart';

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
        String userName = await SpUtil.getString(Constant.SP_USER_NICK_NAME);
        if (userName == null) {
          Get.offNamed(Routes.LOGIN);
        } else {
          Get.offNamed(Routes.HOME);
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
