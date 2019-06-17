import 'package:flutter/services.dart';

class PlatformUtils {
  static const MethodChannel _channel = const MethodChannel('id');

  static Future<String> getChannel() async {
    return await _channel.invokeMethod("getChannel");
  }

  static Future<String> openGPS() async {
    return await _channel.invokeMethod("openGPS");
  }

  static Future<String> getIM(
      String appKey, String userName, String userId) async {
    return await _channel.invokeMethod(
        "IM", {"appkey": appKey, "userName": userName, "userId": userId});
  }

  static Future<String> getAddress(
     double latitude, double longitude) async {
    return await _channel.invokeMethod(
        "getAddress", {"latitude": latitude, "longitude": longitude});
  }

  static Future<Map<dynamic, dynamic>> initShanYan(
      String appId, String appKey) async {
    return await _channel.invokeMethod("initShanYan", {
      "appId": appId,
      "appKey": appKey,
    });
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
