import 'package:flutter/material.dart';
import 'package:flutter_netease/controller/home/my/my_favor_music_controller.dart';
import 'package:flutter_netease/controller/home/my/my_page_controller.dart';
import 'package:flutter_netease/page/home/my/header_view.dart';
import 'package:flutter_netease/util/scroll_behavior.dart';
import 'package:get/get.dart';

///首页 我的模块
class MyPage extends GetView<MyPageController> {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: HeaderView()),
          // SliverToBoxAdapter(child: MyFavorMusic(),),
        ],
      ),
    );
  }
}

// class MyFavorMusic extends GetView<MyFavorMusicController> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(decoration: BoxDecoration(
//         color: Colors.white, borderRadius: BorderRadius.circular(15)), child:,);
//   }
// }

