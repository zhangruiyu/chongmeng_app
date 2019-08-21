import 'dart:convert';
import 'dart:io';

import 'package:chongmeng/function/auto/model/login_entity.dart';
import 'package:chongmeng/global_store/action.dart';
import 'package:chongmeng/global_store/store.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:chongmeng/routes.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/auto_entity.dart';
import 'model/local_user.dart';
import 'navigator_helper.dart';

class UserHelper {
  static Future<LocalUser> initLocalUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String user = prefs.getString("user");
    if (user != null) {
      return LocalUser.fromJson(json.decode(user));
    }
    return null;
  }

  static Future<bool> isLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String user = prefs.getString("user");
    debugPrint(user.toString());
    return user != null;
  }

  static setLogin(LoginData autoEntity) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user", json.encode(autoEntity.toJson()));
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
      NavigatorHelper.pushPageLoginPage(context);
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
      var sp = await initLocalUser();
      return sp.token ?? "";
    } else {
      return null;
    }
  }

  static Future<String> getUserTel() async {
    var sp = await initLocalUser();
    return sp.token;
  }

  static void login(Result<LoginEntity> result, BuildContext context) {
    GlobalStore.store
        .dispatch(GlobalActionCreator.onUpdateLocalUser(result.data.data));
    if (result.data.data.hasPet) {
      Navigator.pop(context);
    } else {
      Navigator.popAndPushNamed(context, PageConstants.PetAddPage);
    }
  }

  static void loginNoPop(Result<LoginEntity> result, BuildContext context) {
    GlobalStore.store
        .dispatch(GlobalActionCreator.onUpdateLocalUser(result.data.data));
  }
}
