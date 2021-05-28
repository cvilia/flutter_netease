import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:flutter_card_swipper/widgets/flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_netease/config/colours.dart';
import 'package:flutter_netease/controller/main/discovery/discovery_page_controller.dart';
import 'package:flutter_netease/model/discovery/block/banner/discovery_banner_bean.dart';
import 'package:flutter_netease/model/discovery/block/block_bean.dart';
import 'package:flutter_netease/model/discovery/block/creatives/resource_bean.dart';
import 'package:flutter_netease/util/scroll_behavior.dart';
import 'package:flutter_netease/widget/hide_keyboard.dart';
import 'package:flutter_netease/widget/page_status.dart';
import 'package:get/get.dart';

///首页 发现模块
///打开抽屉的时，如果不用builder，onPress中传入的context可能会导致打不开抽屉
///使用Builder，传入builder回调的context即可

class DiscoveryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(DiscoveryPageController());
    double windowWidth = MediaQuery.of(context).size.width;
    return HideKeyboard(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      body: Obx(() {
        return _pageContent(controller, windowWidth);
      }),
    ));
  }

  Widget _pageContent(DiscoveryPageController controller, double windowWidth) {
    int pageStatus = controller.pageStatus.value;
    if (pageStatus == 0) {
      return pageLoading();
    } else if (pageStatus == 200) {
      return ScrollConfiguration(
        behavior: MyBehavior(),
        child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (ctx, index) {
              if (index == 0) {
                return _itemContent(controller.blocks.value![0], controller.blocks.value?[0].blockCode, windowWidth);
              } else if (index == 1) {
                return _itemContent(null, 'DISCOVERY_OUT_SERVER', windowWidth);
              } else {
                return _itemContent(
                    controller.blocks.value![index - 1], controller.blocks.value?[index - 1].blockCode, windowWidth);
              }
            },
            separatorBuilder: (ctx, index) => Container(height: 20, width: double.infinity),
            itemCount: controller.blocks.value!.length + 1),
      );
    } else {
      return pageError();
    }
  }

  ///以为中间加了banner下面的小部件，所以block可能为空，这时候showType也为空
  Widget _itemContent(BlockBean? block, String? showType, double windowWidth) {
    Widget child;
    if (showType == 'HOMEPAGE_BANNER') {
      child = _bannerContent(block!);
    } else if (showType == 'DISCOVERY_OUT_SERVER') {
      child = _itemFunctionWidgets();
    } else if (showType == 'HOMEPAGE_BLOCK_PLAYLIST_RCMD') {
      ///推荐歌单
      child = _itemRecommendSongList(block!);
    } else if (showType == 'HOMEPAGE_BLOCK_STYLE_RCMD') {
      ///二次元里的惊喜世界
      child = _itemOfficialRecommendSongs(block!, windowWidth);
    } else if (showType == 'HOMEPAGE_MUSIC_MLOG') {
      ///精选音乐视频
      child = Container();
    } else if (showType == 'HOMEPAGE_BLOCK_MGC_PLAYLIST') {
      ///麻辣炖土豆儿的雷达歌单
      child = Container();
    } else if (showType == 'HOMEPAGE_MUSIC_CALENDAR') {
      ///音乐日历
      child = Container();
    } else if (showType == 'HOMEPAGE_BLOCK_OFFICIAL_PLAYLIST') {
      ///专属场景歌单
      child = Container();
    } else if (showType == 'HOMEPAGE_BLOCK_NEW_ALBUM_NEW_SONG') {
      ///DEFAULT 新歌|新碟|数字专辑
      child = Container();
    } else if (showType == 'HOMEPAGE_YUNBEI_NEW_SONG') {
      ///推荐以下新歌 赚双倍云贝
      child = Container();
    } else if (showType == 'HOMEPAGE_VOICELIST_RCMD') {
      ///播客合辑
      child = Container();
    } else if (showType == 'HOMEPAGE_PODCAST24') {
      ///24小时播客
      child = Container();
    } else if (showType == 'HOMEPAGE_BLOCK_VIDEO_PLAYLIST') {
      ///视频合辑
      child = Container();
    } else if (showType == 'HOMEPAGE_BLOCK_LISTEN_LIVE') {
      ///LOOK直播
      child = Container();
    } else if (showType == 'HOMEPAGE_BLOCK_TOPLIST') {
      ///排行榜
      child = Container();
    } else if (showType == 'HOMEPAGE_BLOCK_FUN_CLUB') {
      ///云村KTV
      child = Container();
    } else {
      child = _itemFunctionWidgets();
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
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Stack(
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
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
                      child: Text(
                        banners[index].typeTitle!,
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                    bottom: 0,
                    right: 0)
              ],
            ),
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
        key: DiscoveryPageController.to.globalKey.value,
        scrollDirection: Axis.horizontal,
        children: [
          _baseItemFunction('每日推荐', 'assets/images/main_page/function_widgets/discovery_day_recommend_icon.png',
              () => DiscoveryPageController.to.onClickDayRecommend()),
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
              () => DiscoveryPageController.to.onClickGames(),
              needMarginRight: true),
        ],
      ),
    );
  }

  ///banner下面横向滑动小部件的base widget
  Widget _baseItemFunction(String text, String assetImage, OnFunctionWidgetClick onFunctionWidgetClick,
      {bool needMarginRight = false}) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: needMarginRight ? 15 : 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onFunctionWidgetClick,
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colours.discovery_function_widget_background,
              child: Image.asset(assetImage, width: 25),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8),
            child: Text(
              text,
              style: TextStyle(color: Colours.app_main_text, fontSize: 12, fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }

  ///推荐歌单
  Widget _itemRecommendSongList(BlockBean block) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration:
          ShapeDecoration(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)), color: Colors.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Container(height: 0.5, color: Colours.app_main_divider),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 15),
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _itemSubTitle(block.uiElement!.subTitle!.title!),
                _itemButtonBorder(Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _itemButtonText(block.uiElement!.button!.text!),
                    SizedBox(
                      width: 8,
                      child: Image.asset(
                        'assets/images/main_page/discovery/discovery_item_title_button_right.png',
                        width: 8,
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ))
              ],
            ),
          ),
          Container(
            height: 130,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return Container(
                    width: index == 0 || index == (block.creatives!.length - 1) ? 110 : 100,
                    height: 130,
                    padding: EdgeInsets.only(
                        left: index == 0 ? 15 : 5, right: index == (block.creatives!.length - 1) ? 15 : 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  block.creatives![index].uiElement!.image!.imageUrl!,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                child: _itemPlayCountStyle(DiscoveryPageController.to.abbreviatedNumber(
                                    block.creatives![index].resources![0].resourceExtInfo!.playCount!)),
                                top: 2,
                                right: 2,
                              )
                            ],
                          ),
                        ),
                        Text(
                          block.creatives![index].uiElement!.mainTitle!.title!,
                          maxLines: 2,
                          softWrap: true,
                          style: TextStyle(color: Colours.app_main_text, fontSize: 10, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  );
                },
                itemCount: block.creatives!.length),
          )
        ],
      ),
    );
  }

  ///推荐歌单下面的官方推荐的歌曲
  Widget _itemOfficialRecommendSongs(BlockBean block, double windowWidth) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration:
          ShapeDecoration(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)), color: Colors.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 15),
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _itemSubTitle(block.uiElement!.subTitle!.title!),
                _itemButtonBorder(Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 8,
                      child: Image.asset(
                        'assets/images/main_page/discovery/discovery_item_title_button_play.png',
                        width: 8,
                        fit: BoxFit.cover,
                      ),
                    ),
                    _itemButtonText(block.uiElement!.button!.text!),
                  ],
                ))
              ],
            ),
          ),
          PageView(
            children: _getItemOfficialRecommendPages(block, windowWidth),
          )
        ],
      ),
    );
  }

  ///官方的推荐歌曲内容
  List<Widget> _getItemOfficialRecommendPages(BlockBean block, double windowWidth) {
    List<Widget> pages = [];
    for (int i = 0; i < block.creatives!.length; i++) {
      pages.add(Container(height: 121,child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _getItemOfficialRecommendPageContent(block.creatives![i].resources!, i, windowWidth),
      ),));
    }
    return pages;
  }

  ///官方的推荐歌曲pageview的内容
  List<Widget> _getItemOfficialRecommendPageContent(List<ResourceBean> resources, int index, double windowWidth) {
    return resources.map((e) {
      String artists = e.resourceExtInfo!.artists![0].name!;
      for (int i = 1; i < e.resourceExtInfo!.artists!.length; i++) {
        artists = artists + '/' + e.resourceExtInfo!.artists![i].name!;
      }
      if (artists.endsWith('/')) {
        artists = artists.substring(0, artists.length - 1);
      }
      return Container(
        height: 35,
        width: double.infinity,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 35,
                  height: 35,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          e.uiElement!.image!.imageUrl!,
                          width: 30,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Opacity(
                        opacity: 0.5,
                        child: Image.asset(
                          'assets/images/main_page/discovery/discovery_item_play.png',
                          width: 35 / 4,
                          fit: BoxFit.fitWidth,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  constraints: BoxConstraints(maxWidth: windowWidth - 30 - 35 - 30 - 13),
                  margin: EdgeInsets.only(left: 10, right: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text.rich(
                        TextSpan(text: e.uiElement!.mainTitle!.title!, children: [
                          TextSpan(
                            text: ' - $artists',
                            style: TextStyle(color: Colours.app_main_text_hint, fontSize: 11),
                          )
                        ]),
                        style: TextStyle(color: Colours.app_main_text, fontSize: 13, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                )
              ],
            ),
            Image.asset(
              'assets/images/main_page/discovery/discovery_item_video_play.png',
              width: 13,
              fit: BoxFit.fitWidth,
            )
          ],
        ),
      );
    }).toList();
  }

  ///item主标题Title 样式
  Widget _itemSubTitle(String text) {
    return Text(
      text,
      style: TextStyle(color: Colours.app_main_text, fontWeight: FontWeight.w600, fontSize: 16),
    );
  }

  ///item副标题（页面导航按钮例如‘更多>’） 边框样式
  Widget _itemButtonBorder(Widget child) {
    return Container(
      height: 20,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colours.app_main_border, width: 0.5),
        ),
      ),
      child: child,
    );
  }

  ///item副标题（页面导航按钮例如‘更多>’） 字体
  Widget _itemButtonText(String text) {
    return Text(
      text,
      style: TextStyle(color: Colours.app_main_text, fontSize: 13),
    );
  }

  ///item播放量样式
  Widget _itemPlayCountStyle(String playCount) {
    return Container(
      height: 18,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: ShapeDecoration(
        color: Colors.white.withAlpha(30),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 8,
            child: Image.asset(
              'assets/images/main_page/discovery/discovery_item_play_count.png',
              matchTextDirection: true,
              excludeFromSemantics: true,
            ),
          ),
          Text(
            playCount,
            style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}

///banner下面的一排小功能控件的点击回调
typedef OnFunctionWidgetClick = Function();
