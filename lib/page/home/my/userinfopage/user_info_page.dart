import 'package:flutter/material.dart';
import 'package:flutter_netease/config/colours.dart';
import 'package:flutter_netease/controller/home/my/UserInfoPageController.dart';
import 'package:flutter_netease/model/user_detail.dart';
import 'package:flutter_netease/util/scroll_behavior.dart';
import 'package:get/get.dart';

class UserInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var parentController = Get.put(UserInfoPageController());
    UserDetail user = Get.arguments;
    return Scaffold(
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: NestedScrollView(
          headerSliverBuilder: (ctx, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                leading: IconButton(
                    icon: Icon(Icons.arrow_back_rounded, color: Colours.grey),
                    onPressed: () => Get.back()),
                actions: [
                  IconButton(
                      icon: Icon(Icons.more_vert_rounded, color: Colours.grey),
                      onPressed: null)
                ],
                pinned: true,
                flexibleSpace: Container(
                  width: double.infinity,
                  height: 300,
                  child: HeaderView(user),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: StickyTabBar(
                  TabBar(
                    controller: parentController.tabController,
                    indicatorColor: Colours.app_main,
                    indicatorWeight: 3,
                    indicatorSize: TabBarIndicatorSize.label,
                    labelColor: Colours.text,
                    unselectedLabelColor: Colours.text_hint,
                    tabs: [
                      Text('主页', style: TextStyle(fontSize: 14)),
                      Text('视频', style: TextStyle(fontSize: 14)),
                      Text('动态', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ),
              )
            ];
          },
          body: Center(
            child: Text('zhongjian'),
          ),
        ),
      ),
    );
  }
}

class HeaderView extends StatelessWidget {
  final UserDetail user;

  HeaderView(this.user);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          child: Image.network(user.profile.backgroundUrl,
              width: double.infinity, height: 200, fit: BoxFit.cover),
        ),
        
      ],
    );
  }
}

class StickyTabBar extends SliverPersistentHeaderDelegate {
  final TabBar child;

  StickyTabBar(this.child);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: this.child,
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => this.child.preferredSize.height;

  @override
  // TODO: implement minExtent
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
