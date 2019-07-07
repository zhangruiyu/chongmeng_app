import 'dart:io';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class SelectPetAvatarState implements Cloneable<SelectPetAvatarState> {
  int id;
  int subId;
  File petAvatar;
  TextEditingController nickTextEditingController;

  @override
  SelectPetAvatarState clone() {
    return SelectPetAvatarState()
      ..nickTextEditingController = nickTextEditingController
      ..id = id
      ..petAvatar = petAvatar
      ..subId = subId;
  }
}

SelectPetAvatarState initState(Map<String, dynamic> args) {
  return SelectPetAvatarState()
    ..id = args['id']
    ..subId = args['subId']
    ..nickTextEditingController = TextEditingController();
}
