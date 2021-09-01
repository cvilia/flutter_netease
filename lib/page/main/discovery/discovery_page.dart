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
import 'package:flutter_netease/util/text_utils.dart';
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
  DiscoveryPageController getController() => Get.put(DiscoveryPageController());

  @override
  Widget pageLoading() => super.pageLoading();

  @override
  Widget pageEmpty() => super.pageEmpty();

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
    switch (showType) {
      case 'HOMEPAGE_BANNER': //轮播图
        return PageSwiper(block: block!);
      case 'DISCOVERY_OUT_SERVER': //轮播图下方的小部件
        return FunctionsWidget();
      case 'HOMEPAGE_BLOCK_PLAYLIST_RCMD': //推荐歌单
        return RecommendSongList(block: block!);
      case 'HOMEPAGE_BLOCK_STYLE_RCMD': //二次元里的惊喜世界
        return OfficialRecommendSongs(block: block!);
      case 'HOMEPAGE_MUSIC_MLOG': //精选音乐视频
        return ChoicenessMusicVideo(block: block!);
      case 'HOMEPAGE_BLOCK_MGC_PLAYLIST': //雷达歌单
        return RadarSongList(block: block!);
      case 'HOMEPAGE_MUSIC_CALENDAR': //音乐日历
        return MusicCalendar(block: block!);
      case 'HOMEPAGE_BLOCK_OFFICIAL_PLAYLIST': //专属场景歌单
        return ExclusiveSceneSongList(block: block!);
      case 'HOMEPAGE_BLOCK_NEW_ALBUM_NEW_SONG': //新歌|新碟|数字专辑
        return NewAlbumNewSong(block: block!);
      case 'HOMEPAGE_YUNBEI_NEW_SONG': //推荐以下新歌 赚双倍云贝
        return SongForYunBei(block: block!);
      case 'HOMEPAGE_VOICELIST_RCMD': //播客合辑
        return PodcastCollection(block: block!);
      case 'HOMEPAGE_PODCAST24': //24小时播客
        return Podcast24(block: block!);
      case 'HOMEPAGE_BLOCK_VIDEO_PLAYLIST': //视频合辑
        return VideoCollection(block: block!);
      case 'HOMEPAGE_BLOCK_LISTEN_LIVE': //Look直播
        return LookLive(block: block!);
      case 'HOMEPAGE_BLOCK_TOPLIST': //排行榜
        return TopList(block: block!);
      case 'HOMEPAGE_BLOCK_FUN_CLUB': //云村KTV
        return CloudKtv(block: block!);
      default:
        return Container();
    }
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
                    child: CachedNetworkImage(height: 150, width:double.infinity,imageUrl: banners[index].pic!, fit: BoxFit.cover),
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
            leftTitle: block.uiElement!.subTitle!.title!,
            rightTitle: block.uiElement!.button?.text,
            iconRight: true,
            iconData: Icons.arrow_forward_ios_sharp,
            onTap: () => controller.onClickRecommendSongListSubTitle(block),
          ),
          Container(
            constraints: BoxConstraints(maxHeight: 140),
            margin: EdgeInsets.only(top: 10),
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
                      Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Text(
                          block.creatives![index].uiElement!.mainTitle!.title!,
                          maxLines: 2,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colours.app_main_text, fontSize: 11),
                        ),
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

///二次元里的惊喜世界
class OfficialRecommendSongs extends StatelessWidget {
  final BlockBean block;

  const OfficialRecommendSongs({required this.block});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<DiscoveryPageController>();
    return RoundContainer(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ItemTopRowTitle(
              leftTitle: block.uiElement!.subTitle!.title!,
              rightTitle: block.uiElement!.button?.text,
              iconRight: false,
              iconData: Icons.play_arrow_sharp,
              onTap: () => controller.onClickOfficialRecommendSongsSubTitle()),
          Container(
            constraints: BoxConstraints(maxHeight: 170),
            margin: EdgeInsets.only(top: 10),
            child: PageView.builder(
              itemCount: block.creatives!.length,
              itemBuilder: (ctx, index) => Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: _pageItem(block.creatives![index].resources!),
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _pageItem(List<ResourceBean> resources) {
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
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(imageUrl: e.uiElement!.image!.imageUrl!, fit: BoxFit.cover),
                      ),
                      Icon(Icons.play_arrow_rounded, color: Colors.white, size: 30)
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
                        style: TextStyle(color: Colours.app_main_text, fontSize: 14, fontWeight: FontWeight.w500),
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
              child: Icon(Icons.video_library_rounded, color: Color(0xffb0b0b0), size: 20),
              visible: !TextUtils.isEmpty(e.resourceExtInfo?.songData?.mvid),
            )
          ],
        ),
      );
    }).toList();
  }
}

///精选音乐视频
class ChoicenessMusicVideo extends StatelessWidget {
  final BlockBean block;

  const ChoicenessMusicVideo({required this.block});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<DiscoveryPageController>();
    return RoundContainer(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ItemTopRowTitle(leftTitle: block.uiElement!.subTitle!.title!),
          Container(
            constraints: BoxConstraints(maxHeight: 190),
            margin: EdgeInsets.only(top: 10),
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return Container(
                    width: 100,
                    margin: EdgeInsets.only(
                      left: index == 0 ? 15 : 0,
                      right: index == block.extInfos!.length - 1 ? 15 : 0,
                    ),
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
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                child: PlayCount(
                                  count: controller.abbreviatedNumber(
                                    block.extInfos![index].resource!.mlogExtVO!.playCount!.toString(),
                                  ),
                                ),
                                top: 5,
                                right: 5,
                              ),
                              Positioned(
                                child: CircleAvatar(
                                  radius: 12.5,
                                  backgroundColor: Colors.white.withOpacity(0.3),
                                  child: Icon(Icons.play_arrow_rounded, color: Colors.white),
                                ),
                                bottom: 5,
                                right: 5,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Text(
                            block.extInfos![index].resource!.mlogBaseData!.text!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colours.app_main_text, fontSize: 11),
                          ),
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
}

///雷达歌单
class RadarSongList extends StatelessWidget {
  final BlockBean block;

  const RadarSongList({required this.block});

  @override
  Widget build(BuildContext context) {
    return RoundContainer(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [ItemTopRowTitle(leftTitle: '雷达歌单')],
    ));
  }
}

///音乐日历
class MusicCalendar extends StatelessWidget {
  final BlockBean block;

  const MusicCalendar({required this.block});

  @override
  Widget build(BuildContext context) {
    return RoundContainer(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [ItemTopRowTitle(leftTitle: '音乐日历')],
    ));
  }
}

///专属场景歌单
class ExclusiveSceneSongList extends StatelessWidget {
  final BlockBean block;

  const ExclusiveSceneSongList({required this.block});

  @override
  Widget build(BuildContext context) {
    return RoundContainer(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [ItemTopRowTitle(leftTitle: '专属场景歌单')],
    ));
  }
}

///新专辑新歌
class NewAlbumNewSong extends StatelessWidget {
  final BlockBean block;

  const NewAlbumNewSong({required this.block});

  @override
  Widget build(BuildContext context) {
    return RoundContainer(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [ItemTopRowTitle(leftTitle: '新专辑新歌')],
    ));
  }
}

///赚取双倍云贝
class SongForYunBei extends StatelessWidget {
  final BlockBean block;

  const SongForYunBei({required this.block});

  @override
  Widget build(BuildContext context) {
    return RoundContainer(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [ItemTopRowTitle(leftTitle: '赚取双倍云贝')],
    ));
  }
}

///播客合辑
class PodcastCollection extends StatelessWidget {
  final BlockBean block;

  const PodcastCollection({required this.block});

  @override
  Widget build(BuildContext context) {
    return RoundContainer(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [ItemTopRowTitle(leftTitle: '播客合辑')],
    ));
  }
}

///24小时播客
class Podcast24 extends StatelessWidget {
  final BlockBean block;

  const Podcast24({required this.block});

  @override
  Widget build(BuildContext context) {
    return RoundContainer(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [ItemTopRowTitle(leftTitle: '24小时播客')],
    ));
  }
}

///视频合辑
class VideoCollection extends StatelessWidget {
  final BlockBean block;

  const VideoCollection({required this.block});

  @override
  Widget build(BuildContext context) {
    return RoundContainer(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [ItemTopRowTitle(leftTitle: '视频合辑')],
    ));
  }
}

///Look直播
class LookLive extends StatelessWidget {
  final BlockBean block;

  const LookLive({required this.block});

  @override
  Widget build(BuildContext context) {
    return RoundContainer(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [ItemTopRowTitle(leftTitle: 'Look直播')],
    ));
  }
}

///排行榜
class TopList extends StatelessWidget {
  final BlockBean block;

  const TopList({required this.block});

  @override
  Widget build(BuildContext context) {
    return RoundContainer(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [ItemTopRowTitle(leftTitle: '排行榜')],
    ));
  }
}


///云村KTV
class CloudKtv extends StatelessWidget {
  final BlockBean block;

  const CloudKtv({required this.block});

  @override
  Widget build(BuildContext context) {
    return RoundContainer(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [ItemTopRowTitle(leftTitle: '云村KTV')],
    ));
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
///[leftTitle] 左边的大标题
///[rightTitle] 右边的小标题，例如更多，查看等等且当[iconRight]不为null的时候才会有效
///[iconRight]左侧标题中的小图标的位置，在文本右边还是左边，当为null的时候说明没有右侧小标题，则此时[rightTitle]无效
///[iconData]左侧标题中的小图标，当且仅当iconRight不为null的时候才存在
///[onTap]点击右侧小标题跳转页面
class ItemTopRowTitle extends StatelessWidget {
  final String leftTitle;
  final String? rightTitle;
  final bool? iconRight;
  final IconData? iconData;
  final OnListenerWithOutParam? onTap;

  const ItemTopRowTitle({required this.leftTitle, this.rightTitle, this.iconRight, this.iconData, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(leftTitle, style: TextStyle(color: Colours.app_main_text, fontWeight: FontWeight.w600, fontSize: 15)),
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
                child: _rightChild(rightTitle!, iconData!),
              ),
            ),
        ],
      ),
    );
  }

  Widget _rightChild(String text, IconData iconData) {
    List<Widget> children = iconRight!
        ? [
            Text(text, style: TextStyle(color: Colours.app_main_text, fontSize: 13)),
            Icon(iconData, color: Colours.app_main_text, size: 12)
          ]
        : [
            Icon(iconData, color: Colours.app_main_text, size: 12),
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
