import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget loadingDialog(BuildContext context) {
  return Align(
    child: Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.black.withAlpha(20),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Theme(
        data: ThemeData(
          cupertinoOverrideTheme: CupertinoThemeData(
            brightness: Brightness.light,
          ),
        ),
        child: CupertinoActivityIndicator(radius: 20),
      ),
    ),
  );
}
