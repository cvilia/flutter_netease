import 'package:flutter/material.dart';
import 'package:flutter_netease/config/colours.dart';
import 'package:flutter_netease/controller/home/home_page_controller.dart';
import 'package:flutter_netease/page/home/discover/discover_page.dart';
import 'package:flutter_netease/page/home/first/first_page.dart';
import 'package:flutter_netease/page/home/my/my_page.dart';
import 'package:flutter_netease/page/home/video/video_page.dart';
import 'package:flutter_netease/route/app_pages.dart';
import 'package:flutter_netease/widget/app_background.dart';
import 'package:get/get.dart';

List<Widget> pages = [FirstPage(), DiscoverPage(), VideoPage(), MyPage()];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomePageController());
    return AppBackground(
      child: Obx(
        () => Scaffold(
          backgroundColor: Colors.transparent,
          bottomNavigationBar: BottomAppBar(
            color: Colours.app_main_background,
            shape: CircularNotchedRectangle(),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BottomBarItem(
                  icon: Icons.music_note,
                  label: '首页',
                  color: controller.currentIndex.value == 0
                      ? Colours.app_main
                      : Colours.text_hint,
                  onTap: () => controller.currentIndex.value = 0,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 45),
                  child: BottomBarItem(
                      icon: Icons.find_in_page,
                      label: '发现',
                      color: controller.currentIndex.value == 1
                          ? Colours.app_main
                          : Colours.text_hint,
                      onTap: () => controller.currentIndex.value = 1),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 45),
                  child: BottomBarItem(
                      icon: Icons.video_call,
                      label: '视频',
                      color: controller.currentIndex.value == 2
                          ? Colours.app_main
                          : Colours.text_hint,
                      onTap: () => controller.currentIndex.value = 2),
                ),
                BottomBarItem(
                    icon: Icons.person,
                    label: '我的',
                    color: controller.currentIndex.value == 3
                        ? Colours.app_main
                        : Colours.text_hint,
                    onTap: () => controller.currentIndex.value = 3),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colours.app_main_background,
            onPressed: () => Get.toNamed(Routes.PLAY_PAGE),
            child: Icon(Icons.play_arrow, size: 28, color: Colors.white),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: pages[controller.currentIndex.value],
        ),
      ),
    );
  }
}

class BottomBarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final Function onTap;

  BottomBarItem({this.icon, this.label, this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colours.app_main_background,
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color),
            Text(label, style: TextStyle(color: color))
          ],
        ),
      ),
    );
  }
}
