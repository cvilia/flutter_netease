import 'dart:convert';

import 'package:flutter_netease/http/api.dart';
import 'package:flutter_netease/http/dio_helper.dart';
import 'package:flutter_netease/log/log.dart';
import 'package:flutter_netease/model/banner_model.dart';
import 'package:get/get.dart';

///首页 首页模块controller
class FirstPageController extends GetxController {
  var bannerModel = Rxn<BannerModel>();

  @override
  void onInit() {
    super.onInit();
    dioHelper.get(Api.GET_BANNER, callBack: (response) {
      if (response != null) {
        var result = json.decode(response.data);
        print(result);
        if (result['code'] == 200) {
          bannerModel.value = BannerModel.fromJson(result);
        }
      }
    });
  }
}
