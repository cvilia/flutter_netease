import 'package:flutter/material.dart';
import 'package:flutter_netease/config/page_status.dart';
import 'package:get/get.dart';

import 'base_get_controller.dart';

abstract class BaseGetView<T extends BaseGetController> extends GetView<T> {
  @override
  Widget build(BuildContext context) {
    return buildContent();
  }

  Widget buildContent();

  Widget obxWidget() {
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

  void dismissDialog() {
    if (Get.isDialogOpen != null && Get.isDialogOpen!) Get.back();
  }

  void preventQuickCLick(){

  }

}
