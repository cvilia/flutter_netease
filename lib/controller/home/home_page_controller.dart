import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_netease/config/constant.dart';
import 'package:flutter_netease/http/dio_helper.dart';
import 'package:flutter_netease/util/sp_util.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  var currentIndex = 0.obs;

  PageController? pageController;

  void onPressBottomBar(int index) {
    if (index == 0) {}
  }

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
    requestLauncherImg();
  }

  @override
  void onClose() {
    super.onClose();
    pageController?.dispose();
  }

  ///请求开屏页图片
  Future<void> requestLauncherImg() async {
    var map = {"method": "mobile", "format": "json", "lx": "suiji"};
    dioHelper.get("https://api.btstu.cn/sjbz/api.php", params: map,
        callBack: (response) {
      if (response != null) {
        var json = jsonDecode(response.data.toString());

        ///该接口返回的字段均为String类型
        if (json['code'] == '200' && json['imgurl'] != null) {
          SpUtil.putString(Constant.SP_LAUNCHER_IMG_URL, json['imgurl']);
        }
      }
    });
  }
}
