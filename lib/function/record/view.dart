import 'package:camera/camera.dart';
import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    RecordState state, Dispatch dispatch, ViewService viewService) {
  var accentColor = Theme.of(viewService.context).accentColor;
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
                  dispatch(RecordActionCreator.onCameraSwitched());
                },
                icon: Icon(
                  MdiIcons.cameraRetakeOutline,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  dispatch(RecordActionCreator.onTakePicture());
                },
                onLongPressStart: (LongPressStartDetails details) {
                  dispatch(RecordActionCreator.onRecordStart());
                },
                onLongPressEnd: (LongPressEndDetails details) {
                  dispatch(RecordActionCreator.onRecordEnd());
                },
                child: new CircularPercentIndicator(
                  radius: 100.0,
                  lineWidth: 10.0,
                  percent: 0.8,
                  center: new Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(90.0))),
                  ),
//                backgroundColor: Colors.white,
                  backgroundColor: colord9d9d9,
                  progressColor: accentColor,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
