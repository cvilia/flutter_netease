import 'package:flutter_netease/config/page_status.dart';
import 'package:get/get.dart';

abstract class BaseGetController extends GetxController {
  var pageStatus = PageStatus.LOADING.obs;
}
