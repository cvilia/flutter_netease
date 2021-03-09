import 'package:flutter/material.dart';
import 'package:flutter_netease/config/colours.dart';
import 'package:flutter_netease/widget/root_actionbar.dart';
import 'package:get/get.dart';

class LocalMusicListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.app_main_background,
      appBar: appBar(
        appBar: AppBar(
          backgroundColor: Colours.app_main_background,
          elevation: 0.5,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded,
                size: 22, color: Colours.app_main_action_bar_icon),
            onPressed: () => Get.back(),
          ),
          centerTitle: true,
          title: Text(
            '本地音乐',
            style: TextStyle(color: Colours.app_main_text, fontSize: 18),
          ),
        ),
      ),
      body: Center(
        child: Text('本地音乐'),
      ),
    );
  }
}
