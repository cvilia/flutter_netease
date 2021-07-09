import 'package:flutter_netease/config/page_status.dart';
import 'package:get/get.dart';

abstract class BaseGetController extends SuperController {
  var pageStatus = PageStatus.LOADING.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }
  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    super.dispose();
  }

}
