import 'dart:io';

import 'package:flutter/material.dart';

///去除滑动控件滑动阴影
class MyBehavior extends ScrollBehavior{

  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    if (Platform.isAndroid) return child;
    return super.buildOverscrollIndicator(context, child, details);
  }
}