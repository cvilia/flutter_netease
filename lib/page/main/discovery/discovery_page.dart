import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:flutter_card_swipper/widgets/flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_netease/config/colours.dart';
import 'package:flutter_netease/controller/main/discovery/discovery_page_controller.dart';
import 'package:flutter_netease/model/discovery/block/banner/discovery_banner_bean.dart';
import 'package:flutter_netease/model/discovery/block/block_bean.dart';
import 'package:flutter_netease/util/scroll_behavior.dart';
import 'package:flutter_netease/widget/hide_keyboard.dart';
import 'package:flutter_netease/widget/page_status.dart';
import 'package:get/get.dart';

///首页 发现模块
///打开抽屉的时，如果不用builder，onPress中传入的context可能会导致打不开抽屉
///使用Builder，传入builder回调的context即可

typedef OnFunctionWidgetClick = Function();

class DiscoveryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(DiscoveryPageController());
    return HideKeyboard(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      body: Obx(() {
        return _pageContent(controller);
      }),
    ));
  }

  Widget _pageContent(DiscoveryPageController controller) {
    int pageStatus = controller.pageStatus.value;
    if (pageStatus == 0) {
      return pageLoading();
    } else if (pageStatus == 200) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (ctx, index) => _itemContent(controller.blocks.value!, index),
              separatorBuilder: (ctx, index) => Container(height: 20, width: double.infinity),
              itemCount:
                  controller.hasMore.value ? controller.blocks.value!.length + 2 : controller.blocks.value!.length + 1),
        ),
      );
    } else {
      return pageError();
    }
  }

  Widget _itemContent(List<BlockBean> blocks, int index) {
    Widget child;
    if (index == 0) {
      child = _bannerContent(blocks[0]);
    } else if (index == 1) {
      return _itemFunctionWidgets();
    } else {
      child = Container();
    }
    return child;
  }

  ///顶部banner
  Widget _bannerContent(BlockBean block) {
    List<DiscoveryBannerBean> banners = block.extInfo!.banners!;

    return Container(
      height: 140,
      child: Swiper(
        itemCount: banners.length,
        autoplay: true,
        indicatorLayout: PageIndicatorLayout.COLOR,
        onIndexChanged: (index) => DiscoveryPageController.to.onBannerCardClicked(),
        itemBuilder: (ctx, index) {
          return Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  width: double.infinity,
                  height: 140,
                  imageUrl: banners[index].pic!,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
                  child: Text(
                    banners[index].typeTitle!,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                bottom: 0,
                right: 0,
              )
            ],
          );
        },
      ),
    );
  }

  ///banner 下面横向滑动的小部件
  Widget _itemFunctionWidgets() {
    return Container(
      height: 75,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _baseItemFunction('每日推荐', 'assets/images/main_page/function_widgets/discovery_day_recommend_icon.png',
              () => DiscoveryPageController.to.onClickDayRecommend(),
              needMarginRight: false),
          _baseItemFunction('私人FM', 'assets/images/main_page/function_widgets/discovery_privacy_fm_icon.png',
              () => DiscoveryPageController.to.onClickPrivacyFM()),
          _baseItemFunction('歌单', 'assets/images/main_page/function_widgets/discovery_song_list_icon.png',
              () => DiscoveryPageController.to.onClickSongList()),
          _baseItemFunction('排行榜', 'assets/images/main_page/function_widgets/discovery_rank_list_icon.png',
              () => DiscoveryPageController.to.onClickRank()),
          _baseItemFunction('直播', 'assets/images/main_page/function_widgets/discovery_live_icon.png',
              () => DiscoveryPageController.to.onClickLive()),
          _baseItemFunction('数字专辑', 'assets/images/main_page/function_widgets/discovery_number_album_icon.png',
              () => DiscoveryPageController.to.onClickNumberAlbum()),
          _baseItemFunction('专注冥想', 'assets/images/main_page/function_widgets/discovery_meditation_icon.png',
              () => DiscoveryPageController.to.onClickMeditation()),
          _baseItemFunction('歌房', 'assets/images/main_page/function_widgets/discovery_song_room_icon.png',
              () => DiscoveryPageController.to.onClickSongRoom()),
          _baseItemFunction('游戏专区', 'assets/images/main_page/function_widgets/discovery_games_icon.png',
              () => DiscoveryPageController.to.onClickGames()),
        ],
      ),
    );
  }

  ///banner下面横向滑动小部件的base widget
  Widget _baseItemFunction(String text, String assetImage, OnFunctionWidgetClick onFunctionWidgetClick,
      {bool needMarginRight = true}) {
    return Container(
      margin: EdgeInsets.only(left: needMarginRight ? 15 : 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onFunctionWidgetClick,
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colours.discovery_function_widget_background,
              child: Image.asset(assetImage, width: 28),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              text,
              style: TextStyle(color: Colours.app_main_text, fontSize: 11),
            ),
          )
        ],
      ),
    );
  }
}
