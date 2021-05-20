import 'package:flutter/material.dart';
import 'package:flutter_netease/controller/main/first/first_page_controller.dart';
import 'package:get/get.dart';

///首页 首页模块

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(FirstPageController());
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Text('首页'),
      ),
    );
  }
}

class HeaderBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text('首页'),
      ),
    );
    // return Obx(() {
    //   BannerModel? model = controller.bannerModel.value;
    //   List<Widget> children = [];
    //   if (model != null && model.code == 200 && model.banners.length > 0) {
    //     for (int i = 0; i < model.banners.length; i++) {
    //       Widget child = ClipRRect(
    //         borderRadius: BorderRadius.circular(10),
    //         child: CachedNetworkImage(
    //           width: double.infinity,
    //           height: 140,
    //           imageUrl: model.banners[i].imageUrl,
    //           fit: BoxFit.cover,
    //         ),
    //       );
    //       children.add(child);
    //     }
    //   }
    //   return children.length > 0
    //       ? CarouselSlider(
    //           items: children,
    //           options: CarouselOptions(
    //             autoPlay: true,
    //             height: 140,
    //             enlargeCenterPage: true,
    //           ))
    //       : Shimmer.fromColors(
    //           child: Container(width: double.infinity, height: 140),
    //           baseColor: Colors.white70,
    //           highlightColor: Colors.white24);
    // });
  }
}
