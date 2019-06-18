import 'dart:convert';
import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/auto_entity.dart';
import 'navigator_helper.dart';

class UserHelper {
  static Future<bool> isLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool flag = prefs.getBool("loginFlag");
    debugPrint(flag.toString());
    return flag ?? false;
  }

  static setLogin(AutoEntity autoEntity, String tel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("loginFlag", true);
    prefs.setString("token", autoEntity.data.token);
    prefs.setString("tel", tel);
    prefs.setString("user", json.encode(autoEntity.data.toJson()));
  }

  static loginCheck(BuildContext context, VoidCallback block) async {
    var loginStatus = await isLogin();
    //可能为null
    if (loginStatus) {
      block();
    } else {
      logout(context);
    }
  }

  //context为null,就不跳转到登录
  static void logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("loginFlag", false);
    await prefs.setString("token", null);
    await prefs.setString("tel", null);
    await prefs.setString("user", null);
    /*Navigator.of(context).pushAndRemoveUntil(
        new MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) {
              return AppRoute.getPage(PageConstants.AutoPage);
            }), (route) {
      return null == route;
    });*/
    if (context != null) {
//      NavigatorHelper.pushPageLoginPage(context);
    }
  }

  static Future<String> saveUserId(String userId) async {
    var sp = await SharedPreferences.getInstance();
    sp.setString("userId", userId);
    return userId;
  }

  static Future<String> getUserId() async {
    var sp = await SharedPreferences.getInstance();
    return sp.getString("userId") ?? "0";
  }

  static Future<String> getUserToken() async {
    if (await isLogin()) {
      var sp = await SharedPreferences.getInstance();
      return sp.getString("token") ?? "";
    } else {
      return null;
    }
  }

  static Future<String> getUserTel() async {
    var sp = await SharedPreferences.getInstance();
    return sp.getString("tel") ?? "";
  }

//  static Future<AutoData> getUser() async {
//    var sp = await SharedPreferences.getInstance();
//    if (sp.getString("user") == null) {
//      return null;
//    }
//    return AutoData.fromJson(json.decode(sp.getString("user")));
//  }
}
