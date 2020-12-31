import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  var currentIndex = 0.obs;

  PageController pageController;

  void onPressBottomBar(int index){
    if(index == 0){

    }
  }

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  @override
  void onClose() {
    super.onClose();
    pageController.dispose();
  }
}
