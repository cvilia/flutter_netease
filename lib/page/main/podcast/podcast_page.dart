import 'package:flutter/material.dart';
import 'package:flutter_netease/widget/hide_keyboard.dart';

///播客
class PodcastPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HideKeyboard(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Text('博客'),
            ),
          ),
        ));
  }
}
