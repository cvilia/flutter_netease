import 'package:flutter/material.dart';
import 'package:flutter_netease/controller/home/video_page_controller.dart';
import 'package:get/get.dart';

///首页 视频模块
class VideoPage extends GetView<VideoPageController>{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('视频'),
    );
  }
}