import 'package:flutter/material.dart';
import 'package:flutter_netease/widget/app_background.dart';
import 'file:///F:/flutter_project/flutter_netease/lib/controller/launcher_controller.dart';
import 'package:get/get.dart';

class LauncherPage extends GetView<LauncherController> {
  @override
  Widget build(BuildContext context) {
    LauncherController controller = Get.put(LauncherController());
    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Obx(
            () => Text(
              '${controller.count.value}',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
