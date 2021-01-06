import 'package:get/get.dart';

///首页 首页模块controller
class FirstPageController extends GetxController {

  final _obj = ''.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;
}