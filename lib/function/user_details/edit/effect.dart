import 'package:chongmeng/global_store/store.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import '../../../routes.dart';
import 'action.dart';
import 'state.dart';

Effect<UserDetailsEditState> buildEffect() {
  return combineEffects(<Object, Effect<UserDetailsEditState>>{
    UserDetailsEditAction.AmendText: _onAmendText,
  });
}

Future _onAmendText(Action action, Context<UserDetailsEditState> ctx) async {
  var user = GlobalStore.store.getState().localUser;
  String nick = user.nickName;
  String description = user.description;
  if (action.payload == "nick") {
    ctx.state.nickTextEditingController.text = (await Navigator.pushNamed(
            ctx.context, PageConstants.EditTextPage,
            arguments: {
              'initText': ctx.state.nickTextEditingController.text,
              'title': "修改昵称",
              "maxLines": 1,
              "maxLength": 10
            })) as String ??
        nick;
  } else if (action.payload == "description") {
    ctx.state.descriptionTextEditingController.text =
        (await Navigator.pushNamed(ctx.context, PageConstants.EditTextPage,
                arguments: {
                  'initText': ctx.state.descriptionTextEditingController.text,
                  'title': "修改个性签名",
                  "maxLines": 6,
                  "maxLength": 50
                })) as String ??
            description;
  }
}
