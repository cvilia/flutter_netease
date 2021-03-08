import 'package:flutter/material.dart';

///点击空白处收起软键盘
class HideKeyboard extends StatelessWidget {
  final Widget child;

  HideKeyboard({@required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: child,
    );
  }
}
