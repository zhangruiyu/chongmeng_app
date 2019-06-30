import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/constants/page_constants.dart';
import 'package:chongmeng/network/entity/cos_entity.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:tencent_cos/tencent_cos.dart';

import 'action.dart';
import 'model/dynamic_selected_pic_task.dart';
import 'state.dart';

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
  var a = ctx.state.successCount = 0;
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
      print(call.method);
      print(call.arguments);
      if (call.method == "onProgress") {
        print(call.arguments['progress'].toInt());
        print('call.arguments[' '] as int');
        print('call.arguments[' '] as int');
//    containsSelectedPic.progressImageKey.currentState
//        .setProgress((call.arguments['progress'] as double).toInt());
      } else if (call.method == "onSuccess") {
        ctx.state.successCount = ctx.state.successCount + 1;
        String netUrl = call.arguments['url'];
        containsSelectedPic.resourcePath =
            "$netUrl*${containsSelectedPic.sequence}";
        if (ctx.state.successCount == ctx.state.picFilePath.length) {
          commitComment();
        }
      }
    }

    TencentCos.setMethodCallHandler(_handleMessages);
    ctx.state.picFilePath.forEach((itemDynamicSelectedPicTask) {
      itemDynamicSelectedPicTask.upload(
          tmpSecretId, tmpSecretKey, sessionToken, expiredTime, cosPath);
    });
  }
}

void commitComment() {
  println("commitComment");
}

void _initState(Action action, Context<CommitMediaState> ctx) {}
