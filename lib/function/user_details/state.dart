import 'package:fish_redux/fish_redux.dart';

class UserDetailsState implements Cloneable<UserDetailsState> {

  @override
  UserDetailsState clone() {
    return UserDetailsState();
  }
}

UserDetailsState initState(Map<String, dynamic> args) {
  return UserDetailsState();
}
