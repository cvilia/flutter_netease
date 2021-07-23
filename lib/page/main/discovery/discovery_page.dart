import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:flutter_card_swipper/widgets/flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_netease/base/base_stateless_widget.dart';
import 'package:flutter_netease/config/colours.dart';
import 'package:flutter_netease/controller/main/discovery/discovery_page_controller.dart';
import 'package:flutter_netease/interface/custom_call_back.dart';
import 'package:flutter_netease/model/discovery/block/banner/discovery_banner_bean.dart';
import 'package:flutter_netease/model/discovery/block/block_bean.dart';
import 'package:flutter_netease/model/discovery/block/creatives/resource_bean.dart';
import 'package:flutter_netease/util/scroll_behavior.dart';
import 'package:flutter_netease/widget/hide_keyboard.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

///首页 发现模块
///打开抽屉的时，如果不用builder，onPress中传入的context可能会导致打不开抽屉
///使用Builder，传入builder回调的context即可

class DiscoveryPage extends BaseStatelessWidget<DiscoveryPageController> {
  @override
  Widget buildContent(DiscoveryPageController controller) {
    return HideKeyboard(
      child: Scaffold(
        backgroundColor: Colours.app_main_background,
        body: Obx(
          () => ScrollConfiguration(
            behavior: MyBehavior(),
            child: SmartRefresher(
              controller: controller.refreshController,
              onRefresh: () => controller.refreshData(),
              onLoading: () => controller.loadData(),
              child: obxWidget(controller),
            ),
          ),
        ),
      ),
    );
  }

  @override
  DiscoveryPageController getController() {
    return Get.isRegistered<DiscoveryPageController>()
        ? Get.find<DiscoveryPageController>()
        : Get.put(DiscoveryPageController());
  }

  @override
  Widget pageLoading() {
    return super.pageLoading();
  }

  @override
  Widget pageEmpty() {
    return super.pageEmpty();
  }

  @override
  Widget pageSuccess(DiscoveryPageController controller) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (ctx, index) {
        if (index == 0) {
          return _itemContent(controller.blocks[0], controller.blocks[0].blockCode!);
        } else if (index == 1) {
          return _itemContent(null, 'DISCOVERY_OUT_SERVER');
        } else {
          return _itemContent(controller.blocks[index - 1], controller.blocks[index - 1].blockCode!);
        }
      },
      separatorBuilder: (ctx, index) => Container(height: 10, width: double.infinity),
      itemCount: controller.blocks.length + 1,
    );
  }

  ///因为中间加了banner下面的小部件，所以block可能为空，这时候showType也为空
  Widget _itemContent(BlockBean? block, String showType) {
    Widget child;
    switch (showType) {
      case 'HOMEPAGE_BANNER': //轮播图
        return PageSwiper(block: block!);
      case 'DISCOVERY_OUT_SERVER': //轮播图下方的小部件
        return FunctionsWidget();
      case 'HOMEPAGE_BLOCK_PLAYLIST_RCMD': //推荐歌单
        return RecommendSongList(block: block!);
    }
    if (showType == 'HOMEPAGE_BLOCK_STYLE_RCMD') {
      ///二次元里的惊喜世界
      child = _itemOfficialRecommendSongs(block!);
    } else if (showType == 'HOMEPAGE_MUSIC_MLOG') {
      ///精选音乐视频
      child = _itemChoicenessMusicVideo(block!);
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
      child = Container();
    }
    return child;
  }

  ///二次元里的惊喜世界
  Widget _itemOfficialRecommendSongs(BlockBean block) {
    return RoundContainer(
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
                    Image.asset(
                      'assets/images/main_page/discovery/discovery_item_title_button_play.png',
                      width: 8,
                      fit: BoxFit.cover,
                    ),
                    _itemButtonText(block.uiElement!.button!.text!),
                  ],
                ))
              ],
            ),
          ),
          SizedBox(
            height: 166,
            child: PageView.builder(
              itemBuilder: (BuildContext context, int index) => Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: _getItemOfficialRecommendPageContent(block.creatives![index].resources!),
              ),
            ),
          )
        ],
      ),
    );
  }

  ///官方的推荐歌曲pageview的内容
  List<Widget> _getItemOfficialRecommendPageContent(List<ResourceBean> resources) {
    double dw = MediaQuery.of(Get.context!).size.width;
    return resources.map((e) {
      String artists = e.resourceExtInfo!.artists![0].name!;
      for (int i = 1; i < e.resourceExtInfo!.artists!.length; i++) {
        artists = artists + '/' + e.resourceExtInfo!.artists![i].name!;
      }
      if (artists.endsWith('/')) {
        artists = artists.substring(0, artists.length - 1);
      }
      return Container(
        height: 50,
        width: double.infinity,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            imageUrl: e.uiElement!.image!.imageUrl!,
                            width: 50,
                            placeholder: (_, __) => SizedBox(
                              height: 20,
                              child: Image.asset(
                                'assets/images/default_pic.png',
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            errorWidget: (_, __, ___) => SizedBox(
                              height: 20,
                              child: Image.asset(
                                'assets/images/default_pic.png',
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            fit: BoxFit.cover,
                          )),
                      Image.asset(
                        'assets/images/main_page/discovery/discovery_item_play.png',
                        width: 20,
                        fit: BoxFit.fitWidth,
                      )
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  constraints: BoxConstraints(maxWidth: dw - 130),
                  margin: EdgeInsets.only(left: 10, right: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(text: e.uiElement!.mainTitle!.title!, children: [
                          TextSpan(
                            text: ' - $artists',
                            style: TextStyle(color: Colours.app_main_text_hint, fontSize: 11),
                          )
                        ]),
                        style: TextStyle(color: Colours.app_main_text, fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      if (e.uiElement!.subTitle != null && e.uiElement!.subTitle!.title != null)
                        Text(
                          e.uiElement!.subTitle!.title!,
                          style: TextStyle(color: Colours.app_main_text_hint, fontSize: 11),
                        ),
                    ],
                  ),
                )
              ],
            ),
            Visibility(
              child: Image.asset(
                'assets/images/main_page/discovery/discovery_item_video_play.png',
                width: 20,
                fit: BoxFit.fitWidth,
              ),
              visible: true,
            )
          ],
        ),
      );
    }).toList();
  }

  ///精选音乐视频
  Widget _itemChoicenessMusicVideo(BlockBean block) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 15),
            margin: EdgeInsets.only(bottom: 10),
            child: _itemSubTitle(block.uiElement!.subTitle!.title!),
          ),
          SizedBox(
            height: 180,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return Container(
                    width: 100,
                    height: 180,
                    margin:
                        EdgeInsets.only(left: index == 0 ? 15 : 0, right: index == block.extInfos!.length - 1 ? 15 : 0),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 100,
                          height: 150,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  imageUrl: block.extInfos![index].resource!.mlogBaseData!.coverUrl!,
                                  width: 100,
                                  height: 150,
                                  placeholder: (_, __) => Image.asset('assets/images/default_pic.png'),
                                  errorWidget: (_, __, ___) => Image.asset('assets/images/default_pic.png'),
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              Positioned(
                                child: _itemPlayCountStyle(DiscoveryPageController.to.abbreviatedNumber(
                                    block.extInfos![index].resource!.mlogExtVO!.playCount!.toString())),
                                top: 2,
                                right: 2,
                              ),
                              Positioned(
                                child: CircleAvatar(
                                  radius: 12.5,
                                  backgroundColor: Colors.white.withOpacity(0.3),
                                  child: Image.asset(
                                    'assets/images/main_page/discovery/discovery_item_play.png',
                                    width: 15,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                bottom: 2,
                                right: 2,
                              )
                            ],
                          ),
                        ),
                        Text(
                          block.extInfos![index].resource!.mlogBaseData!.text!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colours.app_main_text, fontSize: 10, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (ctx, index) => Container(width: 10),
                itemCount: block.extInfos!.length),
          )
        ],
      ),
    );
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
    return Text(text, style: TextStyle(color: Colours.app_main_text, fontSize: 13));
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

///页面顶部的轮播图
class PageSwiper extends StatelessWidget {
  final BlockBean block;

  const PageSwiper({required this.block});

  @override
  Widget build(BuildContext context) {
    List<DiscoveryBannerBean> banners = block.extInfo!.banners!;
    return Container(
      height: 150,
      child: Swiper(
        itemCount: banners.length,
        autoplay: true,
        indicatorLayout: PageIndicatorLayout.COLOR,
        itemBuilder: (ctx, index) {
          return GestureDetector(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(height: 150, imageUrl: banners[index].pic!, fit: BoxFit.fitHeight),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colours.app_main,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Text(banners[index].typeTitle!, style: TextStyle(color: Colors.white, fontSize: 12)),
                  )
                ],
              ),
            ),
            onTap: () => Get.find<DiscoveryPageController>().onSwiperClicked(banners[index]),
          );
        },
      ),
    );
  }
}

///轮播图下面的一排功能组件
class FunctionsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<DiscoveryPageController>();
    return Container(
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _widgetItem('每日推荐', 'discovery_day_recommend_icon.png', () => controller.onClickDayRecommend()),
          _widgetItem('私人FM', 'discovery_privacy_fm_icon.png', () => controller.onClickPrivacyFM()),
          _widgetItem('歌单', 'discovery_song_list_icon.png', () => controller.onClickSongList()),
          _widgetItem('排行榜', 'discovery_rank_list_icon.png', () => controller.onClickRank()),
          _widgetItem('直播', 'discovery_live_icon.png', () => controller.onClickLive()),
          _widgetItem('数字专辑', 'discovery_number_album_icon.png', () => controller.onClickNumberAlbum()),
          _widgetItem('专注冥想', 'discovery_meditation_icon.png', () => controller.onClickMeditation()),
          _widgetItem('歌房', 'discovery_song_room_icon.png', () => controller.onClickSongRoom()),
          _widgetItem('游戏专区', 'discovery_games_icon.png', () => controller.onClickGames(), needMarginRight: true),
        ],
      ),
    );
  }

  ///banner下面横向滑动小部件的base widget
  Widget _widgetItem(String text, String assetImage, OnListenerWithOutParam onTap, {bool needMarginRight = false}) {
    assetImage = 'assets/images/main_page/function_widgets/$assetImage';
    return Container(
      margin: EdgeInsets.only(left: 15, right: needMarginRight ? 15 : 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onTap,
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colours.discovery_function_widget_background,
              child: Image.asset(assetImage, width: 25),
            ),
          ),
          Text(text, style: TextStyle(color: Colours.app_main_text, fontSize: 12, fontWeight: FontWeight.w500))
        ],
      ),
    );
  }
}

///推荐歌单
class RecommendSongList extends StatelessWidget {
  final BlockBean block;

  const RecommendSongList({required this.block});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<DiscoveryPageController>();
    return RoundContainer(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ItemTopRowTitle(
            block: block,
            iconRight: true,
            onTap: () => controller.onClickRecommendSongListSubTitle(block),
          ),
          Container(
            height: 140,
            margin: EdgeInsets.only(top: 5),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                return Container(
                  width: 100,
                  margin: EdgeInsets.only(
                      left: index == 0 ? 15 : 5, right: index == (block.creatives!.length - 1) ? 15 : 5),
                  child: Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                imageUrl: block.creatives![index].uiElement!.image!.imageUrl!,
                                height: 100,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            Positioned(
                              child: PlayCount(
                                  count: controller.abbreviatedNumber(
                                      block.creatives![index].resources![0].resourceExtInfo!.playCount!)),
                              right: 5,
                              top: 5,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        block.creatives![index].uiElement!.mainTitle!.title!,
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colours.app_main_text, fontSize: 11),
                      )
                    ],
                  ),
                );
              },
              itemCount: block.creatives!.length,
            ),
          )
        ],
      ),
    );
  }
}

///播放量样式
class PlayCount extends StatelessWidget {
  final String count;

  const PlayCount({required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(color: Colors.white.withAlpha(50), borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.play_arrow_outlined, color: Colors.white, size: 17),
          Text(count, style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w500))
        ],
      ),
    );
  }
}

///每一个Item顶部的横向title
class ItemTopRowTitle extends StatelessWidget {
  final BlockBean block;
  final bool? iconRight;
  final OnListenerWithOutParam onTap;

  const ItemTopRowTitle({required this.block, this.iconRight, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(block.uiElement!.subTitle!.title!,
              style: TextStyle(color: Colours.app_main_text, fontWeight: FontWeight.w500, fontSize: 15)),
          if (iconRight != null)
            GestureDetector(
              onTap: onTap,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colours.app_main_border, width: 0.5),
                ),
                child: _rightChild(block.uiElement!.button!.text!),
              ),
            ),
        ],
      ),
    );
  }

  Widget _rightChild(String text) {
    List<Widget> children = iconRight!
        ? [
            Text(text, style: TextStyle(color: Colours.app_main_text, fontSize: 13)),
            Icon(Icons.arrow_forward_ios_sharp, color: Colours.app_main_text, size: 13)
          ]
        : [
            Icon(Icons.arrow_forward_ios_sharp, color: Colours.app_main_text, size: 13),
            Text(text, style: TextStyle(color: Colours.app_main_text, fontSize: 13))
          ];
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }
}

///圆角，白底，带上下内边距的Container
class RoundContainer extends StatelessWidget {
  final Widget child;

  const RoundContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: child,
    );
  }
}

///banner下面的一排小功能控件的点击回调
typedef OnFunctionWidgetClick = Function();
