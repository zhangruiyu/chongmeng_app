import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/helper/navigator_helper.dart';
import 'package:chongmeng/network/entity/outermost_entity.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'action.dart';
import 'state.dart';
import 'package:intl/intl.dart';

import 'package:image_picker/image_picker.dart';

Effect<SelectPetAvatarState> buildEffect() {
  return combineEffects(<Object, Effect<SelectPetAvatarState>>{
    SelectPetAvatarAction.SelectPetAvatar: _onSelectPetAvatar,
    SelectPetAvatarAction.AddPet: _onAddPet,
  });
}

Future _onSelectPetAvatar(
    Action action, Context<SelectPetAvatarState> ctx) async {
  var image = (await ImagePicker.pickImage(source: ImageSource.gallery));
  ctx.dispatch(SelectPetAvatarActionCreator.onSetAvatarPath(image));
}

Future _onAddPet(Action action, Context<SelectPetAvatarState> ctx) async {
  String dateTime = DateFormat('yyyy-MM-dd').format(action.payload);
  var result = await RequestClient.request<OutermostEntity>(
      ctx.context, HttpConstants.AddPet,
      queryParameters: {
        'id': ctx.state.id,
        'subId': ctx.state.subId,
        'avatar': ctx.state.petAvatar,
        'birthday': dateTime,
      });
  if (result.hasSuccess) {
    NavigatorHelper.popToMain(ctx.context);
  }
}
