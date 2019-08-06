import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/function/main/community/commit_media/model/upload_task.dart';
import 'package:chongmeng/function/pet/selecttype/model/pet_type_entity.dart';
import 'package:chongmeng/helper/navigator_helper.dart';
import 'package:chongmeng/network/entity/cos_entity.dart';
import 'package:chongmeng/network/entity/outermost_entity.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:chongmeng/routes.dart';
import 'package:chongmeng/utils/date_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:image_picker/image_picker.dart';
import 'action.dart';
import 'state.dart';

Effect<PetAddState> buildEffect() {
  return combineEffects(<Object, Effect<PetAddState>>{
    PetAddAction.SelectPetAvatar: _onSelectPetAvatar,
    PetAddAction.AddPet: _onAddPet,
    PetAddAction.SelectPetType: _onSelectPetType,
  });
}
//
//DatePicker.showDatePicker(viewService.context,
//locale: DateTimePickerLocale.zh_cn,
//onConfirm: (DateTime dateTime, List<int> selectedIndex) {
//dispatch(PetAddActionCreator.onAddPet(dateTime));
//});

Future _onSelectPetType(Action action, Context<PetAddState> ctx) async {
  var petTypeEntity = await RequestClient.request<PetTypeEntity>(
      ctx.context, HttpConstants.PetType);
  if (petTypeEntity.hasSuccess) {
    Navigator.pushNamed(ctx.context, PageConstants.SelectTypePage,
        arguments: {'petTypeEntity': petTypeEntity.data.data});
  }
}

Future _onSelectPetAvatar(Action action, Context<PetAddState> ctx) async {
  var image = (await ImagePicker.pickImage(source: ImageSource.gallery));
  ctx.dispatch(PetAddActionCreator.onSetAvatarPath(image));
}

Future _onAddPet(Action action, Context<PetAddState> ctx) async {
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

commit(Action action, Context<PetAddState> ctx, {String resourcePath}) async {
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
