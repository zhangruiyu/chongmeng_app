import 'dart:io';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class AddTallyState implements Cloneable<AddTallyState> {
  TextEditingController remarkTextEditingController;
  TextEditingController priceTextEditingController;
  List<int> selectId;
  File image;

  String takeDate;

  @override
  AddTallyState clone() {
    return AddTallyState()
      ..image = image
      ..selectId = selectId
      ..takeDate = takeDate
      ..priceTextEditingController = priceTextEditingController
      ..remarkTextEditingController = remarkTextEditingController;
  }
}

AddTallyState initState(Map<String, dynamic> args) {
  return AddTallyState()
    ..selectId = []
    ..priceTextEditingController = TextEditingController()
    ..remarkTextEditingController = TextEditingController();
}
