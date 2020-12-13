import 'dart:ui';

import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  final Widget child;

  AppBackground({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQueryData.fromWindow(window).size.width,
      height: MediaQueryData.fromWindow(window).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.deepOrangeAccent,
            Colors.orange,
          ],
        ),
      ),
      child: child,
    );
  }
}
