import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netease/config/colours.dart';
import 'package:flutter_netease/controller/login_controller.dart';
import 'package:flutter_netease/widget/app_background.dart';
import 'package:flutter_netease/widget/hide_keyboard.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(LoginController());
    return HideKeyboard(
      child: AppBackground(
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          backgroundColor: Colors.transparent,
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            margin: EdgeInsets.only(top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 120,
                  child: TabBar(
                    controller: controller.tabController,
                    indicator: const BoxDecoration(),
                    labelColor: Colours.app_main,
                    labelStyle:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
                    labelPadding: EdgeInsets.zero,
                    unselectedLabelColor: Colours.text_hint,
                    unselectedLabelStyle:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                    tabs: [Tab(text: '手机'), Tab(text: '邮箱')],
                    onTap: (index) {
                      if (index == 0) {
                        //手机登录
                        controller.switchLoginType(true);
                      } else {
                        //邮箱登录
                        controller.switchLoginType(false);
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 80),
                  child: TextFieldBorder(
                    child: Obx(
                      //如果要相应controller中的变量值的变化，就需要用Obx进行包裹
                      () => TextField(
                        focusNode: controller.isPhone.value
                            ? controller.phoneNode
                            : controller.emailNode,
                        controller: controller.isPhone.value
                            ? controller.accountController
                            : controller.emailController,
                        keyboardType: controller.isPhone.value?TextInputType.phone:TextInputType.emailAddress,
                        cursorColor: Colours.app_main,
                        style: TextStyle(
                            color: Colours.app_main,
                            fontSize: 18,
                            letterSpacing: 1.5),
                        decoration: InputDecoration(
                            hintText:
                                controller.isPhone.value ? '请输入手机号' : '请输入网易邮箱',
                            hintStyle: TextStyle(
                              fontSize: 15,
                              color: Colours.text_hint,
                            ),
                            border: InputBorder.none,
                            isCollapsed: true),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: TextFieldBorder(
                    child: TextField(
                      focusNode: controller.passwordNode,
                      controller: controller.passwordController,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      cursorColor: Colours.app_main,
                      style: TextStyle(
                          color: Colours.app_main,
                          fontSize: 18,
                          letterSpacing: 1.5),
                      decoration: InputDecoration(
                          hintText: '请输入登录密码',
                          hintStyle: TextStyle(
                            fontSize: 15,
                            color: Colours.text_hint,
                          ),
                          border: InputBorder.none,
                          isCollapsed: true),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: InkWell(
                    child: Container(
                      width: double.infinity,
                      height: 45,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colours.border),
                          borderRadius: BorderRadius.circular(30)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Text(
                        '登录',
                        style: TextStyle(
                            color: Colours.app_main,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    onTap: () => controller.click2Login(context),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextFieldBorder extends StatelessWidget {
  final Widget child;

  TextFieldBorder({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.bottomLeft,
      padding: EdgeInsets.only(left: 5, bottom: 5),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colours.border, width: 1),
        ),
      ),
      child: child,
    );
  }
}
