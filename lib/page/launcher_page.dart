import 'package:flutter/material.dart';
import 'package:flutter_netease/config/colours.dart';
import 'package:flutter_netease/controller/launcher_controller.dart';
import 'package:flutter_netease/widget/app_background.dart';
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
            () => controller.imgUrl.value == null
                ? Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                          Colours.app_main_background,
                          Colours.app_main
                        ])),
                  )
                : Image.network(
                    controller.imgUrl.value!,
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                  ),
          ),
        ),
      ),
    );
  }
}
