import 'package:fish_redux/fish_redux.dart';

import 'model/user_details_entity.dart';

class UserDetailsState implements Cloneable<UserDetailsState> {
  UserDetailsData data;

  @override
  UserDetailsState clone() {
    return UserDetailsState()..data = data;
  }
}

UserDetailsState initState(Map<String, dynamic> args) {
  return UserDetailsState();
}
