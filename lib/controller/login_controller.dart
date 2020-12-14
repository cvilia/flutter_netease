import 'package:flutter/material.dart';
import 'package:flutter_netease/util/text_utils.dart';
import 'package:flutter_netease/widget/message_button_dialog.dart';
import 'package:get/get.dart';

class LoginController extends GetxController
    with StateMixin, SingleGetTickerProviderMixin {
  var loginTapDown = Colors.transparent.obs;

  TextEditingController accountController;
  TextEditingController passwordController;
  TextEditingController emailController;

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
      await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (ctx) => MessageButtonDialog(
              message: isPhone.value ? '请输入手机号' : '请输入网易邮箱账号',
              fc: () => Get.back()));
      return;
    }
    if (TextUtils.isEmpty(password)) {
      await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (ctx) =>
              MessageButtonDialog(message: '请输入密码', fc: () => Get.back()));
      return;
    }
    String encrptyPassword = TextUtils().
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    accountController = TextEditingController();
    passwordController = TextEditingController();
    emailController = TextEditingController();
    tabController = TabController(length: 2, vsync: this);

    // animationController = AnimationController(
    //     duration: const Duration(milliseconds: 800), vsync: this);
    // curve = CurvedAnimation(parent: animationController, curve: Curves.easeOut);
    // Animation<int> alpha = new IntTween(begin: 0, end: 255).animate(curve);
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
}
