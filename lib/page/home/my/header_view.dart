import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_netease/config/colours.dart';
import 'package:flutter_netease/controller/home/my/header_view_controller.dart';
import 'package:flutter_netease/page/home/my/userinfopage/user_info_page.dart';
import 'package:get/get.dart';

///我的模块顶部头像背景图等信息
class HeaderView extends GetView<HeaderViewController> {
  @override
  Widget build(BuildContext context) {
    var headerController = Get.put(HeaderViewController());
    double xTop = MediaQueryData.fromWindow(window).padding.top;
    return Obx(
      () => headerController.userDetail.value == null
          ? Container()
          : Container(
              width: MediaQueryData.fromWindow(window).size.width,
              height: 150,
              padding: EdgeInsets.only(top: 45 + xTop / 2, left: 30, right: 30),
              child: GestureDetector(
                onTap: () => Get.to(UserInfoPage(),arguments: headerController.userDetail.value),
                child: Container(
                  height: 60,
                  color: Colours.app_main_background,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ClipOval(
                            child: Image.network(
                              headerController
                                  .userDetail.value.profile.avatarUrl,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                    headerController
                                        .userDetail.value.profile.nickname,
                                    style: TextStyle(
                                        color: Colours.text,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17)),
                                Text(
                                    headerController
                                        .userDetail.value.profile.signature,
                                    style: TextStyle(
                                        color: Colours.grey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                          )
                        ],
                      ),
                      Icon(Icons.keyboard_arrow_right_rounded,
                          color: Colours.grey, size: 32)
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
