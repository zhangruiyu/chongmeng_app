import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ReviewIVAction { action }

class ReviewIVActionCreator {
  static Action onAction() {
    return const Action(ReviewIVAction.action);
  }
}
