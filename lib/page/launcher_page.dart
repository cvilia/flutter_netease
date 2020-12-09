import 'package:flutter/material.dart';
import 'package:flutter_netease/controller/launcher/launcher_controller.dart';
import 'package:get/get.dart';

class LauncherPage extends GetView<LauncherController> {
  @override
  Widget build(BuildContext context) {
    LauncherController controller = Get.put(LauncherController());
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.orangeAccent,
            Colors.orange,
            Colors.deepOrangeAccent,
          ],
        ),
      ),
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
