import 'dart:convert';

import 'package:chongmeng/constants/http_constants.dart';
import 'package:chongmeng/function/main/community/commit_media/model/upload_task.dart';
import 'package:chongmeng/function/my_pet/selecttype/model/pet_type_entity.dart';
import 'package:chongmeng/helper/navigator_helper.dart';
import 'package:chongmeng/network/entity/cos_entity.dart';
import 'package:chongmeng/network/entity/outermost_entity.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:chongmeng/network/net_work.dart' as netWork;
import 'package:chongmeng/widget/select_bottom.dart';
import 'package:city_pickers/city_pickers.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:oktoast/oktoast.dart';
import 'action.dart';
import 'state.dart';

Effect<AdoptionAddState> buildEffect() {
  return combineEffects(<Object, Effect<AdoptionAddState>>{
    AdoptionAddAction.ReselectPic: _onReselectPic,
    AdoptionAddAction.Commit: _onCommit,
    AdoptionAddAction.SelectType: _onSelectType,
  });
}

void _onSelectType(Action action, Context<AdoptionAddState> ctx) async {
  String type = action.payload;
  Map<String, dynamic> selectResult;

  if (type == "cityCode") {
    var cityResult = (await CityPickers.showCityPicker(
      context: ctx.context,
    ));
    selectResult = {
      'key':
          cityResult.provinceName + cityResult.cityName + cityResult.areaName,
      'value': cityResult
    };
  } else {
    Map<String, dynamic> params;
    if (type == "petTypeId") {
      var result = await RequestClient.request<PetTypeEntity>(
          ctx.context, HttpConstants.PetType);
      if (result.hasSuccess) {
        params = {}
          ..addEntries(result.data.data.map<MapEntry<String, dynamic>>((item) {
            return MapEntry(item.name, item.id);
          }));
      }
    } else if (type == "sex") {
      params = {"公": 1, "母": 0};
    } else if (type == "isExpellingParasite") {
      params = {"已驱虫": 1, "未驱虫": 0};
    } else if (type == "isSterilization") {
      params = {"已绝育": 1, "未绝育": 0};
    } else if (type == "isImmune") {
      params = {"已免疫": 1, "未免疫": 0};
    }
    selectResult = await showModalBottomSheet(
        context: ctx.context,
        builder: (c) {
          return SelectBottom(
            params: params,
          );
        });
  }

  selectResult['type'] = type;
  ctx.dispatch(AdoptionAddActionCreator.onSetType(selectResult));
}

Future _onCommit(Action action, Context<AdoptionAddState> ctx) async {
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
        'provinceId': state.city.provinceId,
        'cityId': state.city.cityId,
        'areaId': state.city.areaId,
      });
}

Future _onReselectPic(Action action, Context<AdoptionAddState> ctx) async {
  List<String> imgList = await NavigatorHelper.pushFileSelectPageString(
      ctx.context,
      maxSelected: 5);
  if ((imgList?.length ?? 0) > 0) {
    ctx.dispatch(AdoptionAddActionCreator.onChangeSelectPic(
        imgList.map((item) => UploadTask(item)).toList()));
  }
}
