import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

class PermissionHelper {
  //检测需要的权限
  static Future<bool> checkPermission() async {
    return (await checkPermissionStatus())
        .values
        .every((item) => item == PermissionStatus.granted);
  } //检测需要的权限

  static Future<Map<PermissionGroup, PermissionStatus>>
      checkPermissionStatus() async {
    Map<PermissionGroup, PermissionStatus> permissions;
    if (Platform.isIOS) {
      permissions = (await PermissionHandler().requestPermissions([
        PermissionGroup.contacts,
        PermissionGroup.camera,
        PermissionGroup.microphone,
        PermissionGroup.locationWhenInUse,
      ]))
//        ..remove(PermissionGroup.locationWhenInUse)
          ;
    } else {
      permissions = (await PermissionHandler().requestPermissions([
        PermissionGroup.contacts,
        PermissionGroup.phone,
        PermissionGroup.storage,
        PermissionGroup.location,
        PermissionGroup.camera,
        PermissionGroup.microphone,
      ]))
//        ..remove(PermissionGroup.location)
//        ..remove(PermissionGroup.locationAlways)
//        ..remove(PermissionGroup.locationWhenInUse)
          ;
    }
    return permissions;
  }

  static Future<bool> checkUpdatePermission() async {
    var isAgree = (await PermissionHandler().requestPermissions([
      PermissionGroup.storage,
    ]))
        .values
        .every((item) => item == PermissionStatus.granted);
    if (!isAgree) {
      PermissionHandler().openAppSettings();
    }
    return isAgree;
  }

  static Future<bool> checkPhonePermission() async {
    if (Platform.isIOS) return true;
    var isAgree =
        (await PermissionHandler().requestPermissions([PermissionGroup.phone]))
            .values
            .every((item) => item == PermissionStatus.granted);
    if (!isAgree) {
      PermissionHandler().openAppSettings();
    }
    return isAgree;
  }
}
