import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netease/config/colours.dart';

import 'common_utils.dart';

class ImageWrapper extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final BoxFit fit;

  ImageWrapper({required this.url, this.width, this.height, this.fit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    return url.contains('http')
        ? CachedNetworkImage(
            imageUrl: url,
            width: width,
            height: height,
            placeholder: (_, __) => SizedBox(
                  width: width,
                  child: CupertinoActivityIndicator(radius: min(10.0, width! / 3)),
                ),
            errorWidget: (_, __, ___) => Container(
                  width: width,
                  color: Colours.app_main,
                  child: Icon(Icons.error_outline, size: width! / 3),
                ),
            fit: fit)
        : Image.asset(url, width: width, fit: fit);
  }
}
