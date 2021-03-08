import 'package:flutter/material.dart';
import 'package:flutter_netease/config/colours.dart';
import 'package:flutter_netease/controller/home/home_page_controller.dart';
import 'package:flutter_netease/page/home/discover/discover_page.dart';
import 'package:flutter_netease/page/home/first/first_page.dart';
import 'package:flutter_netease/page/home/my/my_page.dart';
import 'package:flutter_netease/page/home/video/video_page.dart';
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
          drawer: MainDrawer(),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBar(
              elevation: 0.5,
              centerTitle: true,
              backgroundColor: Colours.app_main_background,
              leading: Builder(
                builder: (ctx) => IconButton(
                  icon: Icon(Icons.menu_rounded, color: Colours.grey, size: 22),
                  onPressed: () => Scaffold.of(ctx).openDrawer(),
                ),
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.keyboard_voice_rounded,
                      color: Colours.grey, size: 22),
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
                          color: Colours.grey,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 15),
                      ),
                      cursorColor: Colours.app_main,
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
            selectedItemColor: Colours.app_main,
            unselectedItemColor: Colours.text_hint,
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
          backgroundColor: Colours.app_main_background,
          icon: Icon(Icons.home_rounded),
          label: '首页'),
      BottomNavigationBarItem(
          backgroundColor: Colours.app_main_background,
          icon: Icon(Icons.all_out_rounded),
          label: '发现'),
      BottomNavigationBarItem(
          backgroundColor: Colours.app_main_background,
          icon: Icon(Icons.cloud_circle_rounded),
          label: '云村'),
      BottomNavigationBarItem(
          backgroundColor: Colours.app_main_background,
          icon: Icon(Icons.person_outline_rounded),
          label: '我的'),
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
                    image: NetworkImage(
                        'https://p3.music.126.net/OL02rfkLbzAvQ-W4OHJvOA==/109951165418386456.jpg'),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    ClipOval(
                      child: Image.network(
                          'https://p4.music.126.net/Uod614kFPptcj661BPLsOg==/109951165380951600.jpg',
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
