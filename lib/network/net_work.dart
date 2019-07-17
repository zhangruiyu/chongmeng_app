import 'dart:async';
import 'dart:io';

import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/constants/http_constants.dart';
import 'package:chongmeng/entity_factory.dart';
import 'package:chongmeng/helper/navigator_helper.dart';
import 'package:chongmeng/helper/user_helper.dart';
import 'package:chongmeng/network/net_exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:overlay_support/overlay_support.dart';

class RequestClient {
  ///[queryParameters] 参数以map形式
  ///[showLoadingIndicator] 为true时显示加载数据弹框 默认是false
  ///[isPost] 为true时是post请求,默认是true
  static Future<Result<T>> request<T>(
    BuildContext context,
    String requestUrl, {
    Map<String, dynamic> queryParameters,
    bool isPost = true,
    bool showLoadingIndicator = false,
    String contentType = "application/x-www-form-urlencoded",
    bool ignoreToast = false,
  }) async {
    if (showLoadingIndicator) {
      NavigatorHelper.showLoadingDialog(context, true);
    }
    try {
      T result = await _request<T>(context, requestUrl,
          queryParameters: queryParameters,
          isPost: isPost,
          showLoadingIndicator: showLoadingIndicator,
          contentType: contentType,
          ignoreToast: ignoreToast);
      if (showLoadingIndicator) {
        NavigatorHelper.showLoadingDialog(context, false);
      }

      return Future<Result<T>>.value(Result<T>.iniSuccess(result));
    } on NetException catch (e) {
//      buyMoreLlamas();
      if (context != null &&
          !ignoreToast &&
          !ErrorCode.ignoreToastCode.contains(e.code)) {
        toast(context, '网络错误$e');
      }
      return Future<Result<T>>.value(Result.iniFail(e.code));
    } catch (e) {
      if (context != null && !ignoreToast) {
        toast(context, '网络错误$e');
      }
      // 非具体类型
      print('Something really unknown: $e');
      return Future<Result<T>>.value(Result.iniFail(ErrorCode.NormalError));
    } finally {
      if (showLoadingIndicator) {
        NavigatorHelper.showLoadingDialog(context, false);
      }
    }
  }

  static Future<T> _request<T>(
    BuildContext context,
    String requestUrl, {
    Map<String, dynamic> queryParameters,
    bool isPost = true,
    bool showLoadingIndicator = false,
    String contentType = "application/x-www-form-urlencoded",
    bool ignoreToast = false,
  }) async {
    BaseOptions baseOptions = new BaseOptions(
        baseUrl: Platform.isAndroid
            ? "http://192.168.43.148:8080/"
            : HttpConstants.BaseUrl,
        connectTimeout: 10000,
        receiveTimeout: 10000,
        headers: {
          'os': Platform.operatingSystem,
//          'v': packageInfo.version,
          'token': await UserHelper.getUserToken(),
        });

    if (isPost) {
      baseOptions.contentType = ContentType.parse(contentType);
    }
    Dio dio = new Dio(baseOptions);
//    String cookiePath = await UserHelper.getCookiePath();
    if (!isRelease) {
      dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true)); //开启请求日志
    }
    Response response = await (isPost
        ? dio.post(requestUrl, data: queryParameters)
        : dio.get(requestUrl, queryParameters: queryParameters));

    if (response.statusCode == HttpStatus.ok) {
      var data = response.data;
      if (data['status'].toString() == '1003') {
//        UserHelper.loginOut();
        return new Future.value(EntityFactory.generateOBJ<T>(response.data));
      } else if (data['status'].toString() == '0') {
        return new Future.value(EntityFactory.generateOBJ<T>(response.data));
      } else if (data['status'].toString() == '4') {
//          NavigatorHelper.pushPage(context, PageConstants.AuthPage);
        return new Future.error(new NetException(data['status'], data['msg']));
      } else {
        String toastMsg = data['msg'];
        String status = data['status']?.toString();
        if (toastMsg.contains("Cookie") ||
            toastMsg.contains("尚未登录") ||
            status == "7000" ||
            toastMsg.contains("Token")) {
          UserHelper.logout(context);
        } else {
          if (context != null && !ignoreToast) {
            toast(context, toastMsg);
          }
        }
        return new Future.error(new NetException(data['status'], data['msg']));
      }
    } else {
      debugPrint(response.toString());
      if (response.statusCode == 400) {
        return new Future.error(new NetException(response.statusCode,
            "Error getting IP address:\nHttp status ${response.statusCode}"));
      } else {
        return new Future.error(
            new NetException(response.statusCode, response.toString()));
      }
    }
  }
}

class Result<T> {
  bool hasError;
  bool hasSuccess;
  T data;

  //错误码
  int code;

  Result.iniSuccess(
    this.data,
  )   : this.hasError = false,
        this.hasSuccess = true;

  Result.iniFail(
    this.code, {
    this.data,
  })  : this.hasError = true,
        this.hasSuccess = false;
}

class ErrorCode {
  static int NormalError = 500;
  static int BIND_TEL_ERROR_CODE = 1002; // 第三方登录需要绑定手机号
  static List<int> ignoreToastCode = [BIND_TEL_ERROR_CODE];
}
