import 'dart:io';

import 'package:camera/camera.dart';
import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/function/auto/model/login_entity.dart';
import 'package:chongmeng/global_store/action.dart';
import 'package:chongmeng/global_store/store.dart';
import 'package:chongmeng/helper/permission_helper.dart';
import 'package:chongmeng/helper/user_helper.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:chongmeng/routes.dart';
import 'package:chongmeng/utils/jiguang_utils.dart';
import 'package:chongmeng/utils/platform_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:photo/photo.dart';
import 'package:photo_manager/photo_manager.dart';

class NavigatorHelper {
  static popToMain(BuildContext context) {
    Navigator.popUntil(context, ModalRoute.withName(PageConstants.MainPage));
  }

  static popToMainByIndex(BuildContext context, int index) {
    popToMain(context);
//    MainPage.bottomNavigationKey?.currentState?.setNewState(index);
  }

  static OverlayEntry _overlayEntry;

  //是否显示load的dialog
  static showLoadingDialog(BuildContext context, bool isLoading) {
    if (isLoading) {
      _overlayEntry?.remove();
      _overlayEntry = null;
      //获取OverlayState
      OverlayState overlayState = Overlay.of(context);
      //创建OverlayEntry
      _overlayEntry = OverlayEntry(
          builder: (BuildContext context) => Container(
                alignment: Alignment.center,
                child: new CircularProgressIndicator(
                  strokeWidth: 4.0,
                  backgroundColor: Color(0xff7E7E7E),
                  // value: 0.2,
//                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
                ),
                color: Colors.black38,
              ));
      //显示到屏幕上。
      overlayState.insert(_overlayEntry);
    } else {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }

  static void pushWebPage(BuildContext context, String title, String url) {
    Navigator.pushNamed(context, PageConstants.WebviewPage,
        arguments: {'title': title, 'url': url});
  }

  static Future<T> pushRecordPage<T>(BuildContext context,
      {bool isPop: true}) async {
    bool isAgree =
        await PermissionHelper.checkStorageCameraMicrophonePermission();
    if (isAgree) {
      var cameras = await availableCameras();
      if (isPop) {
        return await Navigator.popAndPushNamed(
            context, PageConstants.RecordPage,
            arguments: {"cameras": cameras});
      }
      return await Navigator.pushNamed<T>(context, PageConstants.RecordPage,
          arguments: {"cameras": cameras});
    } else
      return null;
  }

  static Future<List<File>> pushFileSelectPageFile(BuildContext context,
      {int maxSelected = 9}) async {
    List<AssetEntity> imgList = await PhotoPicker.pickAsset(
        context: context,
        pickType: PickType.onlyImage,
        maxSelected: maxSelected);
    return Future.wait(imgList.map((item) async {
      return (await item.file);
    }).toList());
  }

  static Future<List<String>> pushFileSelectPageString(BuildContext context,
      {int maxSelected = 9}) async {
    return (await pushFileSelectPageFile(context, maxSelected: maxSelected))
        .map<String>((File itemFile) => itemFile.path)
        .toList();
  }

  static Future pushPageLoginPage(BuildContext context) async {
    var checkVerifyEnable = await JiguangUtils.checkVerifyEnable();
    if (checkVerifyEnable) {
      //支持
      NavigatorHelper.showLoadingDialog(context, true);
      Map<dynamic, dynamic> initAndOpenShanyanLogin =
          await JiguangUtils.loginAuth();
      print("initAndOpenShanyanLogin $initAndOpenShanyanLogin");
      print(
          "initAndOpenShanyanLogin ${initAndOpenShanyanLogin['code'] == 6001}");
      NavigatorHelper.showLoadingDialog(context, false);
      if (initAndOpenShanyanLogin['code'] == 6000) {
        var registrationID = await JiguangUtils.getRegistrationID();
        var queryParameters = {
          "devToken": registrationID, //极光推送设备ID(选填)
          "loginToken": Uri.encodeComponent(initAndOpenShanyanLogin['message']),
          "channel": (await PlatformUtils.getChannel()),
        };
        var result = await RequestClient.request<LoginEntity>(
            context, HttpConstants.Flashlogin,
            queryParameters: queryParameters, showLoadingIndicator: true);
        if (result.hasSuccess) {
          UserHelper.login(result, context);
          return Future.value();
        } else {
          return Navigator.pushNamed(context, PageConstants.AutoPage);
        }
      } else if (initAndOpenShanyanLogin['code'] == 1011) {
        Navigator.pushNamed(context, PageConstants.AutoPage);
      } else if (initAndOpenShanyanLogin['code'] == 6002) {
        //取消一键登录
      } else {
        print("initAndOpenShanyanLogin 2222");
        var result = Navigator.pushNamed(context, PageConstants.AutoPage);
        return result;
      }
    } else {
      var result = Navigator.pushNamed(context, PageConstants.AutoPage);
      return result;
    }
    return null;
  }
}
