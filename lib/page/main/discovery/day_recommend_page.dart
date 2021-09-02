import 'package:flutter/material.dart';
import 'package:flutter_netease/base/base_stateless_widget.dart';
import 'package:flutter_netease/config/colours.dart';
import 'package:flutter_netease/controller/main/discovery/DayRecommendController.dart';
import 'package:get/get.dart';

///每日推荐歌曲
class DayRecommendPage extends BaseStatelessWidget<DayRecommendController> {
  @override
  Widget buildContent(DayRecommendController controller) {
    return Scaffold(
      backgroundColor: Colours.app_main_background,
      appBar: AppBar(
        title: Text('每日推荐', style: TextStyle(color: Colours.app_main_action_bar_icon, fontSize: 18)),
        centerTitle: false,
        elevation: 1,
        backgroundColor: Colours.app_main_background,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colours.app_main_action_bar_icon,
            size: 22,
          ),
        ),
      ),
    );
  }

  @override
  DayRecommendController getController() {
    return Get.isRegistered<DayRecommendController>()
        ? Get.find<DayRecommendController>()
        : Get.put(DayRecommendController());
  }

  @override
  Widget pageSuccess(DayRecommendController controller) {
    return Container();
  }
}
