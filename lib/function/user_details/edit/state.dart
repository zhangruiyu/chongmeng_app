import 'dart:io';

import 'package:chongmeng/global_store/store.dart';
import 'package:city_pickers/modal/result.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';

class UserDetailsEditState implements Cloneable<UserDetailsEditState> {
  TextEditingController nickTextEditingController;
  TextEditingController descriptionTextEditingController;
  TextEditingController sexTextEditingController;
  TextEditingController cityTextEditingController;

  File localAvatar;
  int localSex;

  Result cityResult;

  @override
  UserDetailsEditState clone() {
    return UserDetailsEditState()
      ..localAvatar = localAvatar
      ..localSex = localSex
      ..sexTextEditingController = sexTextEditingController
      ..nickTextEditingController = nickTextEditingController
      ..cityTextEditingController = cityTextEditingController
      ..cityResult = cityResult
      ..descriptionTextEditingController = descriptionTextEditingController;
  }
}

UserDetailsEditState initState(Map<String, dynamic> args) {
  var user = GlobalStore.store.getState().localUser;
  var nick = user.nickName;
  var description = user.description;
  return UserDetailsEditState()
    ..nickTextEditingController = TextEditingController(text: nick)
    ..cityTextEditingController = TextEditingController(text: user.city)
    ..sexTextEditingController =
        TextEditingController(text: user.sex == 1 ? "男" : "女")
    ..descriptionTextEditingController =
        TextEditingController(text: description);
}
