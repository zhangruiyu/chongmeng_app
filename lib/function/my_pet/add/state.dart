import 'dart:io';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class PetAddState implements Cloneable<PetAddState> {
  int id;
  int subId;
  File petAvatar;
  TextEditingController nickTextEditingController;

  @override
  PetAddState clone() {
    return PetAddState()
      ..nickTextEditingController = nickTextEditingController
      ..id = id
      ..petAvatar = petAvatar
      ..subId = subId;
  }
}

PetAddState initState(Map<String, dynamic> args) {
  return PetAddState()..nickTextEditingController = TextEditingController();
}
