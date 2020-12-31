import 'dart:convert';

import 'package:flutter_netease/config/constant.dart';
import 'package:flutter_netease/http/api.dart';
import 'package:flutter_netease/http/dio_helper.dart';
import 'package:flutter_netease/model/user_detail.dart';
import 'package:flutter_netease/util/sp_util.dart';
import 'package:get/get.dart';

///我的页面顶部的头像背景图等信息controller
class HeaderViewController extends GetxController {
  var userDetail = Rx<UserDetail>();

  @override
  void onInit() async {
    super.onInit();
    String uid = await SpUtil.getString(Constant.SP_USER_ID);
    dioHelper.get(
      Api.DISCOVER_USER_DETAIL,
      params: {'uid': uid},
      callBack: (response) {
        if (response != null) {
          var json = jsonDecode(response.data.toString());
          if (json['code'] == 200) {
            userDetail.value = UserDetail.fromJson(json);
          }
        }
      },
    );
  }
}
