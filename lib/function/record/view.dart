import 'package:camera/camera.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    RecordState state, Dispatch dispatch, ViewService viewService) {
  if (!state.controller.value.isInitialized) {
    return Container();
  }
  final size = MediaQuery.of(viewService.context).size;
  final deviceRatio = size.width / size.height;
  return Scaffold(
    body: Stack(
      children: <Widget>[
        Transform.scale(
            scale: state.controller.value.aspectRatio / deviceRatio,
            child: Center(
                child: AspectRatio(
                    aspectRatio: state.controller.value.aspectRatio,
                    child: CameraPreview(state.controller)))),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
//                  state.controller.
                },
                icon: Icon(
                  MdiIcons.cameraRetakeOutline,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
