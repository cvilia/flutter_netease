import 'package:flutter/material.dart';

PreferredSize appBar({@required AppBar appBar}) {
  return PreferredSize(child: appBar, preferredSize: Size.fromHeight(50));
}
