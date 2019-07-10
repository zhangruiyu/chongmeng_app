import 'dart:math';

import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/function/main/community/commitmedia/model/upload_task.dart';
import 'package:chongmeng/helper/navigator_helper.dart';
import 'package:chongmeng/network/entity/cos_entity.dart';
import 'package:chongmeng/network/entity/outermost_entity.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:chongmeng/utils/date_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
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
  if (ctx.state.petAvatar != null) {
    NavigatorHelper.showLoadingDialog(ctx.context, true);
    Result<CosEntity> cosEntity = await RequestClient.request<CosEntity>(
        ctx.context, HttpConstants.PeriodEffectiveSign,
        queryParameters: {'type': CosType.Pet_AVATAR_TYPE});
    if (cosEntity.hasSuccess) {
      var resourcePath = await UploadTask(ctx.state.petAvatar.path)
          .uploadByData(cosEntity.data.data);
      NavigatorHelper.showLoadingDialog(ctx.context, false);
      commit(action, ctx, resourcePath: resourcePath);
    } else {
      NavigatorHelper.showLoadingDialog(ctx.context, false);
    }
  } else {
    commit(action, ctx);
  }
}

commit(Action action, Context<SelectPetAvatarState> ctx,
    {String resourcePath}) async {
  String dateTime = DateUtils.formatData(action.payload);
  var result = await RequestClient.request<OutermostEntity>(
      ctx.context, HttpConstants.AddPet,
      queryParameters: {
        'id': ctx.state.id,
        'subId': ctx.state.subId,
        'avatar': resourcePath,
        'birthday': dateTime,
      },
      showLoadingIndicator: true);
  if (result.hasSuccess) {
    NavigatorHelper.popToMain(ctx.context);
  }
}
