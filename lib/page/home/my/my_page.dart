import 'package:flutter/material.dart';
import 'package:flutter_netease/controller/home/my_page_controller.dart';
import 'package:get/get.dart';

///首页 我的模块
class MyPage extends GetView<MyPageController> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('我的'),
    );
  }
}
