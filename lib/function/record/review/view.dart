import 'dart:io';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    ReviewIVState state, Dispatch dispatch, ViewService viewService) {
  if (state.type == "image") {
    return Image.file(
      File(state.filePath),
      width: double.infinity,
      height: double.infinity,
    );
  }
  return Scaffold(
    body: Text(state.filePath),
  );
}
