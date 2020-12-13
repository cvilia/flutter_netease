import 'package:flutter/material.dart';
import 'package:flutter_netease/widget/app_background.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Scaffold(
        body: Center(
          child: Text('首页'),
        ),
      ),
    );
  }
}
