import 'dart:convert';

import 'package:flutter_netease/http/api.dart';
import 'package:flutter_netease/http/dio_helper.dart';
import 'package:flutter_netease/model/discovery/block/block_bean.dart';
import 'package:flutter_netease/model/discovery/discovery_bean.dart';
import 'package:get/get.dart';

///首页 发现模块controller
class DiscoveryPageController extends GetxController {
  var hasMore = true.obs;
  var blocks = Rxn<List<BlockBean>>();
  var cursor = "".obs;

  ///页面状态，0=刚进入 200=OK，其他=错误
  var pageStatus = 0.obs;

  @override
  void onInit() {
    super.onInit();
    dioHelper.get(Api.GET_DISCOVERY_DATA, callBack: (response) {
      var jsonMap = jsonDecode(response.data);
      if (jsonMap['code'] == 200) {
        DiscoveryBean discoveryBean = DiscoveryBean.fromJson(jsonMap);
        hasMore.value = discoveryBean.data!.hasMore!;
        cursor.value = discoveryBean.data!.cursor!;
        blocks.value = discoveryBean.data!.blocks!;
        // pageStatus.value = 200;
      } else {
        // pageStatus.value = -1;
      }
    });
  }
}
