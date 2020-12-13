import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with StateMixin, SingleGetTickerProviderMixin {
  var _loginByPhone = 1.obs;
  var loginTapDown = Colors.transparent.obs;

  TextEditingController accountController;
  TextEditingController passwordController;
  TextEditingController emailController;

  TabController tabController;

  get loginByPhone => _loginByPhone;

  set loginByPhone(value) {
    _loginByPhone = value;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    accountController = TextEditingController();
    passwordController = TextEditingController();
    emailController = TextEditingController();
    tabController = TabController(length: 2, vsync: this);
  }
}
