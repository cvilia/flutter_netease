import 'dart:convert';

import 'package:flutter_netease/http/api.dart';
import 'package:flutter_netease/http/dio_helper.dart';
import 'package:flutter_netease/model/discovery_model.dart';
import 'package:get/get.dart';

///首页 发现模块controller
class DiscoverPageController extends GetxController {
  final _obj = ''.obs;

  set obj(value) => _obj.value = value;

  get obj => _obj.value;

  var discoveryModel = Rxn<DiscoveryModel>();

  @override
  void onInit() {
    super.onInit();
    dioHelper.get(Api.GET_DISCOVERY_DATA, callBack: (response) {
      print('条目数量为:000000');
      if (response != null) {
        var json = jsonDecode(response.data.toString());
        discoveryModel.value = DiscoveryModel.fromJson(json);
        print('条目数量为:${discoveryModel.value.data.blocks.length}');
      }
    });
  }
}
