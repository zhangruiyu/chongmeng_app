import 'dart:convert';
import 'dart:io';

import 'package:chongmeng/constants/http_constants.dart';
import 'package:chongmeng/constants/page_constants.dart';
import 'package:chongmeng/function/main/community/commitmedia/state.dart';
import 'package:chongmeng/helper/navigator_helper.dart';
import 'package:chongmeng/network/entity/cos_entity.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:chongmeng/network/outermost_entity.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:path/path.dart' as path;
import 'package:tencent_cos/tencent_cos.dart';

import 'action.dart';
import 'model/dynamic_selected_pic_task.dart';

Effect<CommitMediaState> buildEffect() {
  return combineEffects(<Object, Effect<CommitMediaState>>{
    CommitMediaAction.ReselectPic: _onReselectPic,
    CommitMediaAction.SkipReviewPage: _onSkipReviewPage,
    CommitMediaAction.UploadCommit: _onUploadCommit,
    Lifecycle.initState: _initState,
  });
}

Future _onReselectPic(Action action, Context<CommitMediaState> ctx) async {
  Map<String, String> file =
      await FilePicker.getMultiFilePath(type: FileType.ANY);
  if ((file?.length ?? 0) > 0) {
    ctx.dispatch(CommitMediaActionCreator.onChangeSelectPic(
        file.values.map((item) => DynamicSelectedPicTask(item)).toList()));
  }
}

void _onSkipReviewPage(Action action, Context<CommitMediaState> ctx) {
  Navigator.pushNamed(ctx.context, PageConstants.ReviewIVPage, arguments: {
    'canSkip': false,
    'filePath': ctx.state.videoFilePath,
    'type': "video",
    'thumbnailFile': ctx.state.thumbnailFile,
  });
}

Future _onUploadCommit(Action action, Context<CommitMediaState> ctx) async {
  if (ctx.state.contentTextEditingController.text.length < 5) {
    toast(ctx.context, "不能低于5字");
    return;
  }
  if (ctx.state.contentTextEditingController.text.length > 3000) {
    toast(ctx.context, "不能大于2000字");
    return;
  }
  Result<CosEntity> cosEntity = await RequestClient.request<CosEntity>(
      ctx.context, HttpConstants.PeriodEffectiveSign,
      queryParameters: {'type': CommitType.PIC_TYPE});
  if (cosEntity.hasSuccess) {
    CosData data = cosEntity.data.data;
    var tmpSecretId = data.tmpSecretId;
    var tmpSecretKey = data.tmpSecretKey;
    var sessionToken = data.sessionToken;
    var cosPath = data.cosPath;
    var expiredTime = data.expiredTime;

    Future<Null> _handleMessages(MethodCall call) async {
      String localUrl = call.arguments['localUrl'];
      DynamicSelectedPicTask containsSelectedPic = ctx.state.picFilePath
          .singleWhere((DynamicSelectedPicTask selectedPic) {
        return selectedPic.localUrl == localUrl;
      });
      if (containsSelectedPic == null) {
        print('没找到');
        return;
      }
      //todo  修改进度
      if (call.method == "onProgress") {
        print(call.arguments['progress'].toInt());
//    containsSelectedPic.progressImageKey.currentState
//        .setProgress((call.arguments['progress'] as double).toInt());
      } else if (call.method == "onSuccess") {}
    }

    TencentCos.setMethodCallHandler(_handleMessages);
    NavigatorHelper.showLoadingDialog(ctx.context, true);
    Future.wait(ctx.state.picFilePath.map((itemDynamicSelectedPicTask) {
      return itemDynamicSelectedPicTask.upload(
          tmpSecretId, tmpSecretKey, sessionToken, expiredTime, cosPath);
    })).then((List onValue) async {
      ctx.state.picFilePath.forEach((item) {
        //修改resourcePath
        item.resourcePath =
            "$cosPath${path.basename(File(item.localUrl).path)}";
      });
      var result = await commitComment(ctx.context,
          ctx.state.contentTextEditingController.text, ctx.state.picFilePath);
      NavigatorHelper.showLoadingDialog(ctx.context, false);
      if (result.hasSuccess) {
        NavigatorHelper.popToMain(ctx.context);
      }
    }).catchError((onError) {
//      toast(ctx.context,"图片上传失败,发布失败");
      NavigatorHelper.showLoadingDialog(ctx.context, false);
    });
  }
}

Future<Result<OutermostEntity>> commitComment(
    context, String text, List<DynamicSelectedPicTask> picFilePath) async {
  //图片上传完毕 开始把信息给服务端
  String urls = json.encode(picFilePath.map((DynamicSelectedPicTask dspt) {
    return dspt.resourcePath;
  }).toList());
  return RequestClient.request<OutermostEntity>(
      context, HttpConstants.CommitDynamic,
      queryParameters: {
        'type': 0,
        'dynamicContent': text,
        'urls': urls,
      });
}

void _initState(Action action, Context<CommitMediaState> ctx) {}
