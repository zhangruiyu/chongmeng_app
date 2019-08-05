import 'dart:io';

import 'package:camera/camera.dart';
import 'package:chongmeng/helper/permission_helper.dart';
import 'package:chongmeng/routes.dart';
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

  static void pushPageLoginPage(BuildContext context) {
    Navigator.pushNamed(context, PageConstants.AutoPage);
  }
}
