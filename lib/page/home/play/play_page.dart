import 'package:flutter/material.dart';
import 'package:flutter_netease/controller/home/play_page_controller.dart';
import 'package:get/get.dart';

///首页 播放模块
class PlayPage extends GetView<PlayPageController>{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('播放'),
    );
  }
}