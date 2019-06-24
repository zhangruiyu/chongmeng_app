import 'package:fish_redux/fish_redux.dart';
import 'package:camera/camera.dart';

class RecordState implements Cloneable<RecordState> {
  List<CameraDescription> cameras;

  CameraController controller;

  @override
  RecordState clone() {
    return RecordState()
      ..cameras = cameras
      ..controller = controller;
  }
}

RecordState initState(Map<String, dynamic> args) {
  return RecordState()..cameras = args['cameras'];
}
