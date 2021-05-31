import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_netease/config/constant.dart';
import 'package:flutter_netease/http/api.dart';
import 'package:flutter_netease/http/dio_helper.dart';
import 'package:flutter_netease/model/discovery/block/block_bean.dart';
import 'package:flutter_netease/model/discovery/discovery_bean.dart';
import 'package:flutter_netease/util/sp_util.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

///首页 发现模块controller
class DiscoveryPageController extends GetxController {
  bool hasMore = true;
  var blocks = Rxn<List<BlockBean>>();
  late String cursor;

  ///页面状态，0=刚进入 200=OK，其他=错误
  var pageStatus = 0.obs;

  var currentBlockItems = 0.obs;
  late RefreshController refreshController;

  var globalKey = Rxn<GlobalKey>();

  static DiscoveryPageController get to => Get.find();

  ///处理播放了多少次
  String abbreviatedNumber(String playCount) {
    if (playCount.length < 5) {
      return playCount;
    } else if (playCount.length < 6) {
      return '${playCount.substring(0, 1)}.${playCount.substring(1, 2)}万';
    } else if (playCount.length < 7) {
      return '${playCount.substring(0, 2)}万';
    } else if (playCount.length < 8) {
      return '${playCount.substring(0, 3)}万';
    } else if (playCount.length < 9) {
      return '${playCount.substring(0, 4)}万';
    } else if (playCount.length < 10) {
      return '${playCount.substring(0, 1)}.${playCount.substring(1, 2)}亿';
    } else if (playCount.length < 11) {
      return '${playCount.substring(0, 2)}亿';
    } else if (playCount.length < 12) {
      return '${playCount.substring(0, 3)}亿';
    } else {
      return '${playCount.substring(0, 4)}亿';
    }
  }

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
  void onInit() async {
    super.onInit();

    refreshController = RefreshController();
    globalKey.value = GlobalKey();
    requestData(true);
  }

  Future<void> requestData(bool isRefresh) async {
    if(!hasMore){
      return;
    }
    dioHelper.get(Api.GET_DISCOVERY_DATA, params: {'cookie': await SpUtil.getString(Constant.SP_USER_COOKIE),cursor:cursor},
        callBack: (response) {
      var jsonMap = jsonDecode(response.data);
      if (isRefresh) {
        refreshController.refreshCompleted();
      } else {
        refreshController.loadComplete();
      }
      if (jsonMap['code'] == 200) {
        DiscoveryBean discoveryBean = DiscoveryBean.fromJson(jsonMap);
        hasMore = discoveryBean.data!.hasMore!;
        if (discoveryBean.data!.cursor != null) {
          cursor = discoveryBean.data!.cursor!;
        }
        List<BlockBean> result = discoveryBean.data!.blocks!;
        if(isRefresh){
          blocks.value = result;
        }else{
          blocks.value!.addAll(result);
        }
        pageStatus.value = 200;
      } else {
        if (blocks.value == null) pageStatus.value = -1;
      }
    });
  }
}
