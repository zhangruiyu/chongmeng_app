import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum SearchListAction { action }

class SearchListActionCreator {
  static Action onAction() {
    return const Action(SearchListAction.action);
  }
}
