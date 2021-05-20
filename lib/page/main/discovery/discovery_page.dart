import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netease/controller/main/discovery/discovery_page_controller.dart';
import 'package:flutter_netease/model/discovery/block/banner/discovery_banner_bean.dart';
import 'package:flutter_netease/util/scroll_behavior.dart';
import 'package:flutter_netease/widget/hide_keyboard.dart';
import 'package:flutter_netease/widget/page_status.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

///首页 发现模块
///打开抽屉的时，如果不用builder，onPress中传入的context可能会导致打不开抽屉
///使用Builder，传入builder回调的context即可

class DiscoveryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(DiscoveryPageController());
    return HideKeyboard(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      body: Obx(() {
        return _pageContent(controller);
      }),
    ));
  }

  Widget _pageContent(DiscoveryPageController controller) {
    int pageStatus = controller.pageStatus.value;
    if (pageStatus == 0) {
      return pageLoading();
    } else if (pageStatus == 200) {
      List<Widget> children = [];
      List<DiscoveryBannerBean> banners = controller.blocks.value![0].extInfo!.banners!;
      for (int i = 0; i < banners.length; i++) {
        Widget child = ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(width: double.infinity, height: 140, imageUrl: banners[i].pic!, fit: BoxFit.cover),
        );
        children.add(child);
      }

      return Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(),
              )
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
