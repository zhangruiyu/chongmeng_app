import 'package:fish_redux/fish_redux.dart';

import 'model/user_details_entity.dart';

enum UserDetailsAction { SetUserData, Refresh, SkipEditUserPage }

class UserDetailsActionCreator {
  static Action onSetUserData(UserDetailsData data) {
    return Action(UserDetailsAction.SetUserData, payload: data);
  }

  static Action onRefresh(Map<String, dynamic> map) {
    return Action(UserDetailsAction.Refresh, payload: map);
  }

  static Action onSkipEditUserPage() {
    return const Action(UserDetailsAction.SkipEditUserPage);
  }
}
