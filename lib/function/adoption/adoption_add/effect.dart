import 'package:chongmeng/constants/http_constants.dart';
import 'package:chongmeng/function/main/community/commit_media/model/upload_task.dart';
import 'package:chongmeng/function/pet/selecttype/model/pet_type_entity.dart';
import 'package:chongmeng/helper/navigator_helper.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:chongmeng/widget/select_bottom.dart';
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
  selectResult['type'] = type;
  ctx.dispatch(AdoptionAddActionCreator.onSetType(selectResult));
}

Future _onCommit(Action action, Context<AdoptionAddState> ctx) async {
  var state = ctx.state;
  if (state.petTypeId == null) {
    showToast("请选择宠物种类");
    return;
  }
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
