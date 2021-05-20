import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget pageError() {
  return Center(
    child: Container(
      width: 200,
      height: 200,
      child: Lottie.asset('assets/anim/page_error.json'),
    ),
  );
}

Widget pageLoading() {
  return Center(
    child: Container(
      width: 200,
      height: 200,
      child: Lottie.asset('assets/anim/page_loading.json'),
    ),
  );
}
