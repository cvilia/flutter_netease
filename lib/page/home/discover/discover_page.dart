import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_netease/config/colours.dart';
import 'package:flutter_netease/controller/home/discover/discover_page_controller.dart';
import 'package:flutter_netease/widget/hide_keyboard.dart';
import 'package:get/get.dart';

///首页 发现模块
///打开抽屉的时，如果不用builder，onPress中传入的context可能会导致打不开抽屉
///使用Builder，传入builder回调的context即可

class DiscoverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(DiscoverPageController());
    return HideKeyboard(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Text('发现'),
        ),
      ),
    ));
  }
}
