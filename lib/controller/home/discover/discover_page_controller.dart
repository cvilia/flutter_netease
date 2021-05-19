
import 'package:flutter_netease/http/api.dart';
import 'package:flutter_netease/http/dio_helper.dart';
import 'package:get/get.dart';

///首页 发现模块controller
class DiscoverPageController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    dioHelper.get(Api.GET_DISCOVERY_DATA, callBack: (response) {

    });
  }
}
