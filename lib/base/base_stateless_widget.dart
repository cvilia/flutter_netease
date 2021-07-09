import 'package:flutter/material.dart';
import 'package:flutter_netease/base/base_get_controller.dart';

abstract class BaseStatelessWidget<T extends BaseGetController> extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    T controller = getController();
    return WillPopScope(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: getAppBar(),
        body: buildContent(controller),
      ),
      onWillPop: onWillPop,
    );
  }

  T getController();

  AppBar? getAppBar();

  Widget buildContent(T controller);

  Future<bool> onWillPop() async {
    return true;
  }
}
