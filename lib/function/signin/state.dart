import 'package:fish_redux/fish_redux.dart';

import 'model/sign_list_entity.dart';

class SignInState implements Cloneable<SignInState> {
  SignListData data;
  Map<DateTime, List> markers;

  @override
  SignInState clone() {
    return SignInState()
      ..data = data
      ..markers = markers;
  }
}

SignInState initState(Map<String, dynamic> args) {
  return SignInState()
    ..markers = {}
    ..data = SignListData(
        signList: SignListDataSignlist(signCount: 0, signTime: []),
        totalIntegral: 0,
        multiple: 0);
}
