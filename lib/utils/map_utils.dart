import 'dart:io';

import 'package:flutter/services.dart';
import 'package:oktoast/oktoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class MapUtils {
  static void openMap(String addr, String lat, String lng) async {
//    String localAdd = Uri.encodeFull(
//        "${state.cinemaMovies.cinemaData.nm} (${state.cinemaMovies.cinemaData.addr})");
    String url = Platform.isAndroid
        ? 'geo:$lat,$lng?q=$addr'
        : 'https://maps.apple.com/?q=$addr&ll=$lat,$lng';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      showToast("请安装地图软件");
    }
  }
}
