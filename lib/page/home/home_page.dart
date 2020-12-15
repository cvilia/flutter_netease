import 'package:flutter/material.dart';
import 'package:flutter_netease/page/home/discover/discover_page.dart';
import 'package:flutter_netease/page/home/first/first_page.dart';
import 'package:flutter_netease/page/home/my/my_page.dart';
import 'package:flutter_netease/page/home/play/play_page.dart';
import 'package:flutter_netease/page/home/video/video_page.dart';
import 'file:///F:/flutter_project/flutter_netease/lib/controller/home/home_page_controller.dart';
import 'package:flutter_netease/widget/app_background.dart';
import 'package:get/get.dart';

List<Widget> pages = [FirstPage(), DiscoverPage(), PlayPage(), VideoPage(), MyPage()];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomePageController());
    return AppBackground(
      child: Obx(() => Scaffold(
            backgroundColor: Colors.transparent,
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.orange.withOpacity(0.6),
              currentIndex: controller.currentIndex.value,
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: Colors.black.withOpacity(0.3),
              unselectedLabelStyle: TextStyle(
                color: Colors.black.withOpacity(0.3),
              ),
              selectedItemColor: Colors.white,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(Icons.music_note), label: '首页'),
                BottomNavigationBarItem(icon: Icon(Icons.find_in_page), label: '发现'),
                BottomNavigationBarItem(icon: Icon(null), label: ''),
                BottomNavigationBarItem(icon: Icon(Icons.video_call), label: '视频'),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: '我的'),
              ],
              onTap: (index) => controller.pageController.jumpToPage(index),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.deepOrangeAccent,
              onPressed: () => controller.pageController.jumpToPage(2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.play_arrow,
                    size: 28,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            body: PageView.builder(
                controller: controller.pageController,
                itemCount: pages.length,
                physics: NeverScrollableScrollPhysics(),
                onPageChanged: (index) => controller.currentIndex.value = index,
                itemBuilder: (ctx, index) => pages[index]),
          )),
    );
  }
}
