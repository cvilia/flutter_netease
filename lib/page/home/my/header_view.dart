import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_netease/controller/home/my/header_view_controller.dart';
import 'package:flutter_netease/model/user_detail.dart';
import 'package:get/get.dart';

///我的模块顶部头像背景图等信息
class HeaderView extends GetView<HeaderViewController> {
  @override
  Widget build(BuildContext context) {
    var headerController = Get.put(HeaderViewController());
    double deviceWidth = MediaQueryData.fromWindow(window).size.width;
    double xTop = MediaQueryData.fromWindow(window).padding.top;
    return Obx(
      () => headerController.userDetail.value == null
          ? Container(
            )
          : SizedBox(
              width: MediaQueryData.fromWindow(window).size.width,
              height: 220,
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Image.network(
                    headerController.userDetail.value.profile.backgroundUrl,
                    width: deviceWidth,
                    fit: BoxFit.fitWidth,
                  ),
                  Positioned(
                    child: ClipOval(
                      child: Image.network(
                        headerController.userDetail.value.profile.avatarUrl,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    left: 30,
                    top: 60 +
                        xTop /
                            2, //保证头像在出去状态栏外的区域内垂直居中显示公式为 xTop/2+(220-xTop-100)/2,其中220-xTop-100表示的是出去状态栏出去头像高度后的空白区域总高度
                  )
                ],
              ),
            ),
    );
  }
}
