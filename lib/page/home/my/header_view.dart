import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_netease/config/colours.dart';
import 'package:flutter_netease/controller/home/my/header_view_controller.dart';
import 'package:flutter_netease/util/dimen_util.dart';
import 'package:get/get.dart';

///我的模块顶部头像背景图等信息
class HeaderView extends GetView<HeaderViewController> {
  @override
  Widget build(BuildContext context) {
    px2dp();
    var headerController = Get.put(HeaderViewController());
    double xTop = MediaQueryData.fromWindow(window).padding.top;
    double windowWidth = MediaQueryData.fromWindow(window).size.width;
    double cardWidth =
        (windowWidth - 2 * 20 - 2 * 30) / 3; //减去两边的padding，并设置两个card之间的距离为20
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HeaderItemView(cardWidth, Icons.folder_rounded, '本地音乐', () => null),
          HeaderItemView(cardWidth, Icons.favorite_rounded, '本地收藏', () => null,
              color: Colours.red),
          HeaderItemView(
              cardWidth, Icons.timelapse_rounded, '最近播放', () => null),
        ],
      ),
    );
  }
}

class HeaderItemView extends StatelessWidget {
  final double cardWidth;
  final IconData iconData;
  final String title;
  final Color color;
  final Function onTap;

  HeaderItemView(this.cardWidth, this.iconData, this.title, this.onTap,
      {this.color = Colours.text_hint});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        alignment: Alignment.center,
        width: cardWidth,
        height: 160,
        decoration: BoxDecoration(
            color: Colours.border, borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              iconData,
              color: color,
              size: 30,
            ),
            Container(
              height: 5,
            ),
            Text(
              '最近播放',
              style: TextStyle(color: color, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
