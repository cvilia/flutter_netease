import 'dart:io';

import 'package:flutter/material.dart';

///去除滑动控件滑动阴影
class MyBehavior extends ScrollBehavior{

  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    if(Platform.isAndroid||Platform.isFuchsia){
      return child;
    }
    return super.buildViewportChrome(context, child, axisDirection);
  }
}