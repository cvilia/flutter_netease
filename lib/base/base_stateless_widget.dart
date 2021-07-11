import 'package:flutter/material.dart';
import 'package:flutter_netease/base/base_get_controller.dart';
import 'package:flutter_netease/config/page_status.dart';

abstract class BaseStatelessWidget<T extends BaseGetController> extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    T controller = getController();
    return WillPopScope(
      child: Scaffold(backgroundColor: Colors.white, appBar: getAppBar(), body: buildContent(controller)),
      onWillPop: onWillPop,
    );
  }

  T getController();

  AppBar? getAppBar();

  Widget buildContent(T controller);

  Widget obxWidget(T controller) {
    PageStatus pageStatus = controller.pageStatus.value;
    if (pageStatus == PageStatus.LOADING) {
      return pageLoading();
    } else if (pageStatus == PageStatus.EMPTY) {
      return pageEmpty();
    } else if (pageStatus == PageStatus.OK) {
      return pageOK();
    } else if (pageStatus == PageStatus.NETWORK_ERROR) {
      return pageNetworkError();
    } else if (pageStatus == PageStatus.SERVER_ERROR) {
      return pageServerError();
    } else if (pageStatus == PageStatus.INVALID_LOGIN) {
      return pageInvalidLogin();
    } else {
      return Container();
    }
  }

  bool showLoadingDialog() => false;

  Widget pageLoading() => Container();

  Widget pageEmpty() => Container(child: Text('无数据', style: TextStyle(color: Colors.black, fontSize: 18)));

  Widget pageOK();

  Widget pageNetworkError() => Container(child: Text('网络错误', style: TextStyle(color: Colors.black, fontSize: 18)));

  Widget pageServerError() => Container(child: Text('服务器错误', style: TextStyle(color: Colors.black, fontSize: 18)));

  Widget pageInvalidLogin() => Container(child: Text('无效登录', style: TextStyle(color: Colors.black, fontSize: 18)));

  Future<bool> onWillPop() async {
    return true;
  }
}
