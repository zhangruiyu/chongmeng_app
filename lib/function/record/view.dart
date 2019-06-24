import 'package:camera/camera.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    RecordState state, Dispatch dispatch, ViewService viewService) {
  if (!state.controller.value.isInitialized) {
    return Container();
  }
  return AspectRatio(
      aspectRatio: state.controller.value.aspectRatio,
      child: CameraPreview(state.controller));
}
