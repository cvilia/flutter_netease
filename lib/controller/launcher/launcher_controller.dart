import 'dart:async';

import 'package:flutter_netease/route/app_pages.dart';
import 'package:get/get.dart';

class LauncherController extends GetxController {
  Timer _timer;
  var count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      count.value++;
      if (count.value == 3) {
        timer.cancel();
        // Get.toNamed(Routes.HOME);
        Get.offNamed(Routes.HOME);
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
