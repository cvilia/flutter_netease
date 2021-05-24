import 'dart:convert';

import 'package:flutter/material.dart';
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

  var currentBlockItems = 0.obs;

  var globalKey = Rxn<GlobalKey>();

  static DiscoveryPageController get to => Get.find();

  ///点击了banner
  void onBannerCardClicked() {}

  ///点击每日推荐
  void onClickDayRecommend() {
    print('每日推荐');
  }

  ///点击私人fm
  void onClickPrivacyFM() {}

  ///点击歌单
  void onClickSongList() {}

  ///点击排行榜
  void onClickRank() {}

  ///点击直播
  void onClickLive() {}

  ///点击数字专辑
  void onClickNumberAlbum() {}

  ///点击专注冥想
  void onClickMeditation() {}

  ///点击歌房
  void onClickSongRoom() {}

  ///点击游戏专区
  void onClickGames() {}

  @override
  void onInit() {
    super.onInit();
    globalKey.value = GlobalKey();
    dioHelper.get(Api.GET_DISCOVERY_DATA, callBack: (response) {
      var jsonMap = jsonDecode(response.data);
      if (jsonMap['code'] == 200) {
        DiscoveryBean discoveryBean = DiscoveryBean.fromJson(jsonMap);
        hasMore.value = discoveryBean.data!.hasMore!;
        if (discoveryBean.data!.cursor != null) {
          cursor.value = discoveryBean.data!.cursor!;
        }
        blocks.value = discoveryBean.data!.blocks!;
        currentBlockItems.value = blocks.value!.length;
        pageStatus.value = 200;
      } else {
        pageStatus.value = -1;
      }
    });
  }
}
