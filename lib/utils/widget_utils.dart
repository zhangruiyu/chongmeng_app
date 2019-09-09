import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

class WidgetUtils {
  static buildPicWidget(String url) {
    return url.startsWith("http")
        ? CachedNetworkImage(
            imageUrl: url,
          )
        : Image.file(File(url));
  }
}
