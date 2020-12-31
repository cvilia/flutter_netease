import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_netease/config/colours.dart';

class AppBackground extends StatelessWidget {
  final Widget child;

  AppBackground({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQueryData.fromWindow(window).size.width,
      height: MediaQueryData.fromWindow(window).size.height,
      color: Colours.app_main_background,
      // decoration: BoxDecoration(
      //   gradient: LinearGradient(
      //     begin: Alignment.topLeft,
      //     end: Alignment.bottomRight,
      //     colors: [
      //       Colors.deepOrangeAccent,
      //       Colors.orange,
      //     ],
      //   ),
      // ),
      child: child,
    );
  }
}
