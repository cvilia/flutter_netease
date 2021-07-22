import 'package:flutter_netease/controller/main/discovery/discovery_page_controller.dart';
import 'package:get/get.dart';

class DiscoveryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DiscoveryPageController());
  }
}
