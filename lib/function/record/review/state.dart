import 'package:fish_redux/fish_redux.dart';

class ReviewIVState implements Cloneable<ReviewIVState> {
  String filePath;
  String type;

  @override
  ReviewIVState clone() {
    return ReviewIVState()
      ..filePath = filePath
      ..type = type;
  }
}

ReviewIVState initState(Map<String, dynamic> args) {
  return ReviewIVState()
    ..filePath = args['filePath']
    ..type = args['type'];
}
