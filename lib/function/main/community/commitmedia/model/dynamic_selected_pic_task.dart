import 'package:flutter/material.dart';
import 'package:tencent_cos/tencent_cos.dart';

class DynamicSelectedPicTask {
  String localUrl;

  //上传到服务器的 包含排序
  String resourcePath;

//  GlobalKey<ProgressImageState> progressImageKey;

  int sequence;

  DynamicSelectedPicTask(this.localUrl);

  void upload(
    tmpSecretId,
    tmpSecretKey,
    sessionToken,
    expiredTime,
    cosPath,
  ) {
    TencentCos.uploadByFile(
        'ap-beijing-1',
        '1253631018',
        "",
        tmpSecretId,
        tmpSecretKey,
        sessionToken,
        expiredTime,
        cosPath + localUrl.substring(localUrl.lastIndexOf("/")),
        localUrl.toString());
  }
}
