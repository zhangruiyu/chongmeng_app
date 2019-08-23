import 'dart:io';

import 'package:chongmeng/global_store/store.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:chongmeng/widget/select_bottom.dart';
import 'package:city_pickers/city_pickers.dart' as city;
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:image_picker/image_picker.dart';

import '../../../routes.dart';
import 'action.dart';
import 'state.dart';

Effect<UserDetailsEditState> buildEffect() {
  return combineEffects(<Object, Effect<UserDetailsEditState>>{
    UserDetailsEditAction.AmendText: _onAmendText,
    UserDetailsEditAction.ReselectAvatar: _onReselectAvatar,
    UserDetailsEditAction.ReselectSex: _onReselectSex,
    UserDetailsEditAction.ReselectCity: _onReselectCity,
    UserDetailsEditAction.UpdateUserInfo: _onUpdateUserInfo,
  });
}

//修改文字
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

Future _onReselectAvatar(
    Action action, Context<UserDetailsEditState> ctx) async {
  File image = (await ImagePicker.pickImage(source: ImageSource.gallery));
  ctx.dispatch(UserDetailsEditActionCreator.onSetLocalAvatar(image));
}

Future _onReselectSex(Action action, Context<UserDetailsEditState> ctx) async {
  Map<String, dynamic> localSex = await showModalBottomSheet(
      context: ctx.context,
      builder: (c) {
        return SelectBottom(
          params: {'男': 1, '女': 0},
        );
      });
  if (localSex != null)
    ctx.state
      ..sexTextEditingController.text = localSex['key']
      ..localSex = localSex['value'];
}

Future _onReselectCity(Action action, Context<UserDetailsEditState> ctx) async {
  city.Result cityResult = (await city.CityPickers.showCityPicker(
    context: ctx.context,
  ));
  if (cityResult != null) {
    ctx.state
      ..cityResult = cityResult
      ..cityTextEditingController.text =
          cityResult.provinceName + cityResult.cityName + cityResult.areaName;
  }
}

Future _onUpdateUserInfo(
    Action action, Context<UserDetailsEditState> ctx) async {}
/*

Future _onCommit(Action action, Context<UserDetailsEditState> ctx) async {
  var state = ctx.state;
  if (state.petTypeId == null) {
    showToast("请选择宠物种类");
    return;
  }
  if (state.sex == null) {
    showToast("请选择宠物性别");
    return;
  }

  if (state.isExpellingParasite == null) {
    showToast("请选择是否驱虫");
    return;
  }
  if (state.isSterilization == null) {
    showToast("请选择宠物是否绝育");
    return;
  }
  if (state.isImmune == null) {
    showToast("请选择宠物接种疫苗");
    return;
  }
  if (state.petNameTextEditingController.text?.isEmpty == true) {
    showToast("请填写宠物名称");
    return;
  }
  if (state.descriptionTextEditingController.text?.isEmpty == true) {
    showToast("请填写描述信息");
    return;
  }
  if (state.ageTextEditingController.text?.isEmpty == true) {
    showToast("请填写宠物年龄");
    return;
  }
  if (state.requestTextEditingController.text?.isEmpty == true) {
    showToast("请填写宠物领养要求");
    return;
  }
  if (state.masterNameTextEditingController.text?.isEmpty == true) {
    showToast("请填写宠物送养人姓名");
    return;
  }
  if (state.masterWechatTextEditingController.text?.isEmpty == true) {
    showToast("请填写宠物送养人微信");
    return;
  }
  if (ctx.state.selectPicList.length <= 0) {
    showToast("图片必须上传一张");
    return;
  }
  var cosEntity = await RequestClient.request<CosEntity>(
      ctx.context, HttpConstants.PeriodEffectiveSign,
      queryParameters: {'type': CosType.Adoption_TYPE});
  if (cosEntity.hasSuccess) {
    NavigatorHelper.showLoadingDialog(ctx.context, true);
    Future.wait(ctx.state.selectPicList.map((itemDynamicSelectedPicTask) {
      return itemDynamicSelectedPicTask.uploadByData(cosEntity.data.data);
    })).then((List onValue) async {
      //图片json串
      String picJson =
          json.encode(ctx.state.selectPicList.map((UploadTask dspt) {
        return dspt.resourcePath();
      }).toList());
      var result = await commit(ctx, picJson);
      NavigatorHelper.showLoadingDialog(ctx.context, false);
      if (result.hasSuccess) {
        showToast("发布成功");
        Navigator.pop(ctx.context);
      }
    }).catchError((onError) {
//      showToast("图片上传失败,发布失败");
      NavigatorHelper.showLoadingDialog(ctx.context, false);
    });
  }
}

Future<netWork.Result<OutermostEntity>> commit(
    Context<AdoptionAddState> ctx, String picJson) async {
  var state = ctx.state;
  return RequestClient.request<OutermostEntity>(
      ctx.context, HttpConstants.AdoptionAdd,
      showLoadingIndicator: true,
      queryParameters: {
        'petTypeId': state.petTypeId,
        'petName': state.petNameTextEditingController.text,
        'sex': state.sex,
        'age': state.ageTextEditingController.text,
        'images': picJson,
        //
        'isImmune': state.isImmune,
        'isSterilization': state.isSterilization,
        'isExpellingParasite': state.isExpellingParasite,
        //
        'description': state.descriptionTextEditingController.text,
        'request': state.requestTextEditingController.text,
        'masterName': state.masterNameTextEditingController.text,
        'masterWechat': state.masterWechatTextEditingController.text,
        'cityCode': state.cityCode,
        'cityShow': state.cityTextEditingController.text,
      });
}
*/
