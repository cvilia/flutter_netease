import 'package:flutter/material.dart';
import 'package:flutter_netease/controller/main/my/my_page_controller.dart';
import 'package:get/get.dart';

///首页 我的模块
class MyPage extends GetView<MyPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text('我的isBlank'),
      ),
    );
  }
}
