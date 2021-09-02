import 'dart:convert';

import 'package:flutter_netease/base/base_get_controller.dart';
import 'package:flutter_netease/bridge/mmkv.dart';
import 'package:flutter_netease/config/constant.dart';
import 'package:flutter_netease/config/page_status.dart';
import 'package:flutter_netease/http/api.dart';
import 'package:flutter_netease/http/dio_helper.dart';
import 'package:flutter_netease/model/discovery/block/banner/discovery_banner_bean.dart';
import 'package:flutter_netease/model/discovery/block/block_bean.dart';
import 'package:flutter_netease/model/discovery/discovery_bean.dart';
import 'package:flutter_netease/page/main/discovery/day_recommend_page.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

///首页 发现模块controller
class DiscoveryPageController extends BaseGetController {
  static const String TAG = 'DiscoveryPageController';
  bool? hasMore;
  var blocks = RxList<BlockBean>();
  String? cursor;
  var pageStatus = PageStatus.LOADING.obs;

  var currentBlockItems = 0.obs;
  late RefreshController refreshController;

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
  void onClickDayRecommend() => Get.to(DayRecommendPage());

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
    refreshController = RefreshController(initialRefresh: true);
  }

  Future<void> refreshData() async {
    dioHelper.get(
      Api.GET_DISCOVERY_DATA,
      params: {'cookie': await MMKV.getString(Constant.SP_USER_COOKIE), 'cursor': cursor},
      callBack: (response) {
        refreshController.refreshCompleted();
        var jsonMap = jsonDecode(response.data);
        if (jsonMap['code'] == 200) {
          DiscoveryBean discoveryBean = DiscoveryBean.fromJson(jsonMap);
          if (discoveryBean.data != null && discoveryBean.data!.blocks != null) {
            cursor = discoveryBean.data!.cursor;
            hasMore = discoveryBean.data!.hasMore;
            blocks.value = discoveryBean.data!.blocks!;
            pageStatus.value = PageStatus.OK;
          } else {
            pageStatus.value = PageStatus.EMPTY;
          }
        } else {
          pageStatus.value = PageStatus.NETWORK_ERROR;
        }
      },
    );
  }

  Future<void> loadData() async {
    if (hasMore != null && !hasMore!) return;
    dioHelper.get(
      Api.GET_DISCOVERY_DATA,
      params: {'cookie': await MMKV.getString(Constant.SP_USER_COOKIE), 'cursor': cursor},
      callBack: (response) {
        if (refreshController.isLoading) refreshController.loadComplete();
        var jsonMap = jsonDecode(response.data);
        if (jsonMap['code'] == 200) {
          DiscoveryBean discoveryBean = DiscoveryBean.fromJson(jsonMap);
          if (discoveryBean.data != null && discoveryBean.data!.blocks != null) {
            cursor = discoveryBean.data!.cursor!;
            hasMore = discoveryBean.data!.hasMore!;
            blocks.addAllIf(discoveryBean.data!.blocks!.length > 0, discoveryBean.data!.blocks!);
            pageStatus.value = PageStatus.OK;
          } else {
            pageStatus.value = PageStatus.EMPTY;
          }
        } else {
          pageStatus.value = PageStatus.NETWORK_ERROR;
        }
      },
    );
  }

  ///点击Swiper中的图片
  void onSwiperClicked(DiscoveryBannerBean banner) {
    ///TODO 轮播图点击事件
  }

  ///点击了推荐歌单右上角的更多
  void onClickRecommendSongListSubTitle(BlockBean block) {}

  ///点击了二次元的惊喜世界右上角
  void onClickOfficialRecommendSongsSubTitle() {}
}
