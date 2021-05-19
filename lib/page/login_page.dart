import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netease/config/colours.dart';
import 'package:flutter_netease/controller/login_controller.dart';
import 'package:flutter_netease/widget/hide_keyboard.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(LoginController());
    return HideKeyboard(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colours.app_main_background,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          margin: EdgeInsets.only(
              top: MediaQueryData.fromWindow(window).padding.top),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 120,
                child: TabBar(
                    controller: controller.tabController,
                    indicator: const BoxDecoration(),
                    labelColor: Colours.app_main_text,
                    labelStyle:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
                    labelPadding: EdgeInsets.zero,
                    unselectedLabelColor: Colours.app_main_unselected,
                    unselectedLabelStyle:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                    tabs: [Tab(text: '手机'), Tab(text: '邮箱')],
                    onTap: (index) => controller.switchLoginType(index == 0)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 80),
                    child: TextFieldBorder(
                      child: Obx(
                        //如果要相应controller中的变量值的变化，就需要用Obx进行包裹
                        () => TextField(
                          controller: controller.accountController,
                          keyboardType: controller.isPhone.value
                              ? TextInputType.phone
                              : TextInputType.emailAddress,
                          cursorColor: Colours.app_main_courser,
                          style: TextStyle(
                              color: Colours.app_main_text,
                              fontSize: 18,
                              letterSpacing: 1.5),
                          decoration: InputDecoration(
                              hintText: controller.isPhone.value
                                  ? '请输入手机号'
                                  : '请输入网易邮箱',
                              hintStyle: TextStyle(
                                fontSize: 15,
                                color: Colours.app_main_text_hint,
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
                        controller: controller.passwordController,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        cursorColor: Colours.app_main_courser,
                        style: TextStyle(
                            color: Colours.app_main_text,
                            fontSize: 18,
                            letterSpacing: 1.5),
                        decoration: InputDecoration(
                            hintText: '请输入登录密码',
                            hintStyle: TextStyle(
                              fontSize: 15,
                              color: Colours.app_main_text_hint,
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
                            border: Border.all(color: Colours.app_main_border),
                            borderRadius: BorderRadius.circular(30)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Text(
                          '登录',
                          style: TextStyle(
                              color: Colours.app_main_text,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      onTap: () => controller.click2Login(context),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFieldBorder extends StatelessWidget {
  final Widget child;

  TextFieldBorder({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.bottomLeft,
      padding: EdgeInsets.only(left: 5, bottom: 5),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colours.app_main_border, width: 1),
        ),
      ),
      child: child,
    );
  }
}
