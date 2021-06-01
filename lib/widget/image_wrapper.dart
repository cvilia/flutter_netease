import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netease/config/colours.dart';

class ImageWrapper extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final BoxFit fit;

  ImageWrapper({required this.url, this.width, this.height, this.fit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      width: width,
      height: height,
      placeholder: (_, __) => Image.asset(
        'assets/images/main_page/main_navigation_item_discovery.png',
        width: width,
        fit: fit,
      ),
      errorWidget: (_, __, ___) => Image.asset(
        'assets/images/main_page/main_navigation_item_discovery.png',
        width: width,
        fit: fit,
      ),
      fit: fit,
    );
  }
}
