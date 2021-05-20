import 'dart:convert';

import 'package:flutter_netease/http/api.dart';
import 'package:flutter_netease/http/dio_helper.dart';
import 'package:flutter_netease/model/discovery/discovery_bean.dart';
import 'package:get/get.dart';

///首页 首页模块controller
class FirstPageController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    dioHelper.get(Api.GET_DISCOVERY_DATA, callBack: (response) {
      print(response.data);
      DiscoveryBean discoveryBean =
          DiscoveryBean.fromJson(jsonDecode(response.data));
    });
  }
}
