import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum SignInAction { SetPageData, Sign }

class SignInActionCreator {
  static Action onSetPageData(data) {
    return Action(SignInAction.SetPageData, payload: data);
  }

  static Action onSign() {
    return const Action(SignInAction.Sign);
  }
}
