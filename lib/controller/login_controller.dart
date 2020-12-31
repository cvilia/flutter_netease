import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_netease/config/constant.dart';
import 'package:flutter_netease/http/api.dart';
import 'package:flutter_netease/http/dio_helper.dart';
import 'package:flutter_netease/route/app_pages.dart';
import 'package:flutter_netease/util/sp_util.dart';
import 'package:flutter_netease/util/text_utils.dart';
import 'package:flutter_netease/widget/loading_dialog.dart';
import 'package:flutter_netease/widget/message_button_dialog.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class LoginController extends GetxController
    with StateMixin, SingleGetTickerProviderMixin {
  var loginTapDown = Colors.transparent.obs;

  TextEditingController accountController;
  TextEditingController passwordController;
  TextEditingController emailController;
  FocusNode phoneNode = FocusNode();
  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();

  TabController tabController;

  AnimationController animationController;
  Animation curve;

  var isPhone = true.obs;

  void switchLoginType(bool type) {
    isPhone.value = type;
  }

  void click2Login(BuildContext context) async {
    String account =
        isPhone.value ? accountController.text : emailController.text;
    String password = passwordController.text;
    if (TextUtils.isEmpty(account)) {
      Get.dialog(MessageButtonDialog(
          message: isPhone.value ? '请输入手机号' : '请输入网易邮箱账号',
          onTap: () => Get.back()));
      return;
    }
    if (TextUtils.isEmpty(password)) {
      Get.dialog(
          MessageButtonDialog(message: '请输入密码', onTap: () => Get.back()));
      return;
    }
    String encryptPassword = TextUtils.toMd5(password);

    Get.dialog(LoadingDialog());
    if (isPhone.value) {
      //手机登录
      await dioHelper.get(Api.LOGIN_BY_PHONE,
          params: {'phone': account, 'md5_password': encryptPassword},
          callBack: (response) =>
              route2App(response, encryptPassword, account));
    } else {
      //邮箱登录
      await dioHelper.get(Api.LOGIN_BY_MAIL,
          params: {'email': account, 'md5_password': encryptPassword},
          callBack: (response) =>
              route2App(response, encryptPassword, account));
    }
  }

  void route2App(response, encryptPassword, account) async {
    Get.back();
    if (response == null) {
      Get.dialog(
          MessageButtonDialog(message: '登录失败，请检查网络', onTap: () => Get.back()));
    } else {
      var json = jsonDecode(response.data.toString());
      if (json['code'] == 200) {
        saveUserInfo(json, encryptPassword, account);
        Get.offNamed(Routes.HOME);
      } else {
        Get.dialog(
            MessageButtonDialog(message: json['msg'], onTap: () => Get.back()));
      }
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    accountController = TextEditingController();
    passwordController = TextEditingController();
    emailController = TextEditingController();
    tabController = TabController(length: 2, vsync: this);
    phoneNode.addListener(() async {
      if (phoneNode.hasPrimaryFocus) {
        await Permission.phone.request();
      }
    });
    emailNode.addListener(() async {
      if (emailNode.hasPrimaryFocus) {
        await Permission.phone.request();
      }
    });
    passwordNode.addListener(() async {
      if (passwordNode.hasFocus) {
        await Permission.phone.request();
      }
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    accountController.dispose();
    passwordController.dispose();
    emailController.dispose();
    tabController.dispose();
    // animationController.dispose();
  }

  void saveUserInfo(json, encryptPassword, account) async {
    await SpUtil.putBoolean(Constant.SP_USER_LOGIN, true);
    await SpUtil.putString(Constant.SP_USER_ID, json['account']['id'].toString());
    await SpUtil.putString(
        Constant.SP_USER_NICK_NAME, json['profile']['nickname']);
    await SpUtil.putString(Constant.SP_USER_MD5_PASSWORD, encryptPassword);
  }
}
