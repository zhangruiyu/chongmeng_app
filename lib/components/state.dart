import 'package:fish_redux/fish_redux.dart';

class UploadImageState implements Cloneable<UploadImageState> {

  @override
  UploadImageState clone() {
    return UploadImageState();
  }
}

UploadImageState initState(Map<String, dynamic> args) {
  return UploadImageState();
}
