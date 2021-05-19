import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netease/config/colours.dart';

import 'common_utils.dart';

enum ImageType {
  assets,
  net,
}

class ImageWrapper extends StatelessWidget {
  final String url;
  final double width;
  final double? height;
  final BoxFit fit;
  final ImageType imageType;

  ImageWrapper(
      {required this.url,
        required this.width,
        this.height,
        this.fit = BoxFit.cover,
        this.imageType = ImageType.assets});

  @override
  Widget build(BuildContext context) {
    return imageType == ImageType.net
        ? CachedNetworkImage(
        imageUrl: imgUrl,
        width: width,
        height: height,
        placeholder: (_, __) => SizedBox(
          width: width,
          child: CupertinoActivityIndicator(radius: min(10.0, width / 3)),
        ),
        errorWidget: (_, __, ___) => Container(
          width: width,
          color: Colours.app_main,
          child: Icon(Icons.error_outline, size: width / 3),
        ),
        fit: fit)
        : Image.asset(imgUrl, width: width, fit: fit);
  }

  String get imgUrl {
    switch (imageType) {
      case ImageType.assets:
        return imgPath(url);
      case ImageType.net:
        return url;
      default:
        return url;
    }
  }
}