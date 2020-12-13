import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netease/controller/login_controller.dart';
import 'package:flutter_netease/widget/app_background.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(LoginController());
    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          margin: EdgeInsets.only(top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 150,
                child: TabBar(
                  controller: controller.tabController,
                  indicator: const BoxDecoration(),
                  labelStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
                  labelPadding: EdgeInsets.zero,
                  unselectedLabelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                  tabs: [Tab(text: '手机'), Tab(text: '邮箱')],
                  onTap: (index) {
                    if (index == 0) {
                      //手机登录
                    } else {
                      //邮箱登录
                    }
                  },
                ),
              ),
              TextField(),
              TextField(),
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: InkWell(
                  child: Container(
                    width: double.infinity,
                    height: 45,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(30)),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      '登录',
                      style:
                          TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
