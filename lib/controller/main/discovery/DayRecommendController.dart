import 'dart:convert';

import 'package:flutter_netease/http/api.dart';
import 'package:flutter_netease/http/dio_helper.dart';
import 'package:flutter_netease/model/discovery/day_recommend_bean.dart';
import 'package:get/get.dart';
import 'package:flutter_netease/base/base_get_controller.dart';
import 'package:flutter_netease/config/page_status.dart';

class DayRecommendController extends BaseGetController {
  var pageStatus = PageStatus.LOADING.obs;

  var data = Rxn<Data>();

  @override
  void onInit() {
    super.onInit();
    dioHelper.get(Api.GET_DAY_RECOMMEND, callBack: (response) {
      var jsonMap = jsonDecode(response.data);
      if (jsonMap['code'] == 200) {
        DayRecommendBean bean = DayRecommendBean.fromJson(jsonMap);
        if (bean.data != null && bean.data!.dailySongs != null) {
          data.value = bean.data!;
          pageStatus.value = PageStatus.OK;
        } else {
          pageStatus.value = PageStatus.EMPTY;
        }
      } else {
        pageStatus.value = PageStatus.NETWORK_ERROR;
      }
    });
  }
}
