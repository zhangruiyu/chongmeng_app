import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum SearchFiltrateAction { action }

class SearchFiltrateActionCreator {
  static Action onAction() {
    return const Action(SearchFiltrateAction.action);
  }
}
