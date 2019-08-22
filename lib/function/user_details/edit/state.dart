import 'package:chongmeng/global_store/store.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';

class UserDetailsEditState implements Cloneable<UserDetailsEditState> {
  TextEditingController nickTextEditingController;
  TextEditingController descriptionTextEditingController;

  @override
  UserDetailsEditState clone() {
    return UserDetailsEditState()
      ..nickTextEditingController = nickTextEditingController
      ..descriptionTextEditingController = descriptionTextEditingController;
  }
}

UserDetailsEditState initState(Map<String, dynamic> args) {
  var user = GlobalStore.store.getState().localUser;
  var nick = user.nickName;
  var description = user.description;
  return UserDetailsEditState()
    ..nickTextEditingController = TextEditingController(text: nick)
    ..descriptionTextEditingController =
        TextEditingController(text: description);
}
