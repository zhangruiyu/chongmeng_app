import 'package:flutter/material.dart';
import 'package:tencent_cos/tencent_cos.dart';

class DynamicSelectedPicTask {
  String localUrl;

  //上传到服务器的 包含排序
  String resourcePath;

//  GlobalKey<ProgressImageState> progressImageKey;

  int sequence;

  DynamicSelectedPicTask(this.localUrl);

  Future<Map<String, dynamic>> upload(
    tmpSecretId,
    tmpSecretKey,
    sessionToken,
    expiredTime,
    cosPath,
  ) {
    return TencentCos.uploadByFile(
        'ap-beijing',
        '1253631018',
        "mengchong",
        tmpSecretId,
        tmpSecretKey,
        sessionToken,
        expiredTime,
        cosPath + localUrl.substring(localUrl.lastIndexOf("/")),
        localUrl.toString());
  }

  @override
  String toString() {
    return 'DynamicSelectedPicTask{localUrl: $localUrl, resourcePath: $resourcePath, sequence: $sequence}';
  }
}
