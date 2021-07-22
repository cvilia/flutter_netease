import 'package:flutter/material.dart';
import 'package:flutter_netease/config/colours.dart';
import 'package:flutter_netease/controller/main/main_page_controller.dart';
import 'package:flutter_netease/page/main/ktv/ktv_page.dart';
import 'package:flutter_netease/widget/app_background.dart';
import 'package:flutter_netease/widget/root_actionbar.dart';
import 'package:get/get.dart';

import 'cloud/cloud_page.dart';
import 'discovery/discovery_page.dart';
import 'my/my_page.dart';
import 'podcast/podcast_page.dart';


class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(MainPageController());
    List<Widget> pages = [DiscoveryPage(), PodcastPage(), MyPage(), KTVPage(), CloudPage()];
    return AppBackground(
      child: Obx(
        () => Scaffold(
          drawer: MainDrawer(),
          appBar: appBar(
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              backgroundColor: Colours.app_main_background,
              leading: Builder(
                builder: (ctx) => IconButton(
                  icon: Icon(Icons.menu_rounded, color: Colours.app_main_action_bar_icon, size: 22),
                  onPressed: () => Scaffold.of(ctx).openDrawer(),
                ),
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.keyboard_voice_rounded, color: Colours.app_main_action_bar_icon, size: 22),
                  onPressed: null,
                )
              ],
              title: Visibility(
                visible: true,
                child: SizedBox(
                  height: 35,
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextField(
                      maxLines: 1,
                      scrollPhysics: NeverScrollableScrollPhysics(),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colours.app_main_icon_in_textfield,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 15),
                      ),
                      cursorColor: Colours.app_main_courser,
                    ),
                  ),
                ),
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            items: getItems(),
            iconSize: 20,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colours.app_main,
            unselectedItemColor: Colours.app_main_unselected,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            onTap: (index) => controller.currentIndex.value = index,
          ),
          body: pages[controller.currentIndex.value],
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> getItems() {
    return [
      BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/images/main_page/main_navigation_item_discovery.png')), label: '发现'),
      BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/images/main_page/main_navigation_item_podcast.png')), label: '播客'),
      BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/images/main_page/main_navigation_item_my.png')), label: '我的'),
      BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/images/main_page/main_navigation_item_ktv.png')), label: 'K歌'),
      BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/images/main_page/main_navigation_item_cloud.png')), label: '云村'),
    ];
  }
}

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Container(
          color: Colours.app_main_background,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20.0),
                height: 180,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage('https://p3.music.126.net/OL02rfkLbzAvQ-W4OHJvOA==/109951165418386456.jpg'),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    ClipOval(
                      child: Image.network('https://p4.music.126.net/Uod614kFPptcj661BPLsOg==/109951165380951600.jpg',
                          width: 60.0),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 50.0),
                      child: Text(
                        '麻辣炖土豆儿',
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
