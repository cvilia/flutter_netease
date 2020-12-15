import 'package:get/get.dart';

///首页 播放模块controller
class PlayPageController extends GetxController {
  final _obj = ''.obs;

  set obj(value) => _obj.value = value;

  get obj => _obj.value;
}
