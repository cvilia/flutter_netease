import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netease/controller/home/first/first_page_controller.dart';
import 'package:flutter_netease/model/banner_model.dart';
import 'package:flutter_netease/util/scroll_behavior.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

///首页 首页模块

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: HeaderBanner(),
            )
          ],
        ),
      ),
    );
  }
}

class HeaderBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(FirstPageController());
    return Obx(() {
      BannerModel model = controller.bannerModel.value;
      List<Widget> children = [];
      if (model != null && model.code == 200 && model.banners.length > 0) {
        for (int i = 0; i < model.banners.length; i++) {
          Widget child = ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              width: double.infinity,
              height: 140,
              imageUrl: model.banners[i].imageUrl,
              fit: BoxFit.cover,
            ),
          );
          children.add(child);
        }
      }
      return children.length > 0
          ? CarouselSlider(
              items: children,
              options: CarouselOptions(
                autoPlay: true,
                height: 140,
                enlargeCenterPage: true,
              ))
          : Shimmer.fromColors(
              child: Container(width: double.infinity, height: 140),
              baseColor: Colors.white70,
              highlightColor: Colors.white24);
    });
  }
}
