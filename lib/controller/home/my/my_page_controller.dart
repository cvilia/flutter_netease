import 'package:get/get.dart';

///首页 我的模块controller
class MyPageController extends GetxController {

  final _obj = ''.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;
}
