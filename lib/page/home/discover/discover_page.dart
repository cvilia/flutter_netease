import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_netease/config/colours.dart';
import 'package:flutter_netease/controller/home/discover_page_controller.dart';
import 'package:flutter_netease/widget/hide_keyboard.dart';
import 'package:get/get.dart';

///首页 发现模块
///打开抽屉的时，如果不用builder，onPress中传入的context可能会导致打不开抽屉
///使用Builder，传入builder回调的context即可

class DiscoverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(DiscoverPageController());
    return HideKeyboard(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colours.app_main_background,
        leading: Builder(
            builder: (ctx) => IconButton(
                  icon: Icon(Icons.menu_rounded, color: Colours.grey),
                  onPressed: () => Scaffold.of(ctx).openDrawer(),
                )),
        title: SizedBox(
          height: 40,
          width: double.infinity,
          child: Container(
            height: double.infinity,
            margin: EdgeInsets.only(right: 30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextField(
              maxLines: 1,
              scrollPhysics: NeverScrollableScrollPhysics(),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search,color: Colours.grey,),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 15),
              ),
              cursorColor: Colours.app_main,
            ),
          ),
        ),
      ),
      drawer: DiscoverDrawer(),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Text('发现'),
        ),
      ),
    ));
  }
}

class DiscoverDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
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
                    child: Text('麻辣炖土豆儿',
                        style: TextStyle(fontSize: 20.0, color: Colors.white)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
