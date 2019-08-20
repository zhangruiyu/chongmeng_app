import 'dart:io';

import 'package:flutter/services.dart';

class PlatformUtils {
  static const MethodChannel _channel = const MethodChannel('chongmeng');

  static Future<String> getChannel() async {
    return Platform.isAndroid
        ? await _channel.invokeMethod("getChannel")
        : Future.value("ios");
  }

  static Future<String> openGPS() async {
    return await _channel.invokeMethod("openGPS");
  }

  static Future<String> getIM(
      String appKey, String userName, String userId) async {
    return await _channel.invokeMethod(
        "IM", {"appkey": appKey, "userName": userName, "userId": userId});
  }

  static Future<String> getAddress(double latitude, double longitude) async {
    return await _channel.invokeMethod(
        "getAddress", {"latitude": latitude, "longitude": longitude});
  }

  //安卓唯一标识
  static Future<String> get imsi async {
    return await _channel.invokeMethod<String>("imsi");
  }

  //idfa(ios only)
  static Future<String> get idfa async {
    return await _channel.invokeMethod<String>("idfa");
  }

  //安卓 getWifiMac
  static Future<String> get getWifiMac async {
    return _channel.invokeMethod<String>("getWifiMac");
  }
}
