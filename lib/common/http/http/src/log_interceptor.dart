// ignore_for_file: type_literal_in_constant_pattern

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:nft_flutter/common/utils/log_util.dart';

/// Log 拦截器
/// Created by guoshuyu
/// on 2019/3/23.
class LogsInterceptors extends InterceptorsWrapper {
  static List<Map?> sHttpResponses = [];
  static List<String?> sResponsesHttpUrl = [];

  static List<Map<String, dynamic>?> sHttpRequest = [];
  static List<String?> sRequestHttpUrl = [];

  static List<Map<String, dynamic>?> sHttpError = [];
  static List<String?> sHttpErrorUrl = [];

  @override
  onRequest(RequestOptions options, handler) async {
    if (kDebugMode) {
      if (kDebugMode) {
        LoggerUtil.d("请求url：${options.uri} ${options.method}");
      }
      options.headers.forEach((k, v) => options.headers[k] = v ?? "");
      if (kDebugMode) {
        LoggerUtil.d('请求头: ${options.headers}');
      }
      if (kDebugMode) {

        if(options.method == "POST"){
          LoggerUtil.d('请求参数: ${options.data}');
        }else{
          LoggerUtil.d('请求参数: ${options.queryParameters}');
        }
      }


    }
    try {
      addLogic(sRequestHttpUrl, options.path);
      dynamic data;
      if (options.data is Map) {
        data = options.data;
      } else {
        data = <String, dynamic>{};
      }
      var map = {
        "header:": {...options.headers},
      };
      if (options.method == "POST") {
        map["data"] = data;
      }
      addLogic(sHttpRequest, map);
    } catch (e) {
      if (kDebugMode) {
        LoggerUtil.e(e);
      }
    }
    return super.onRequest(options, handler);
  }

  @override
  onResponse(Response response, handler) async {
    if (kDebugMode) {
      if (kDebugMode) {
        print('${response.realUri}返回参数: $response');
      }
    }
    switch (response.data.runtimeType) {
      case Map || List:
        {
          try {
            var data = <String, dynamic>{};
            data["data"] = response.data;
            addLogic(sResponsesHttpUrl, response.requestOptions.uri.toString());
            addLogic(sHttpResponses, data);
          } catch (e) {
            if (kDebugMode) {
              print(e);
            }
          }
        }
      case String:
        {
          try {
            var data = <String, dynamic>{};
            data["data"] = response.data;
            addLogic(sResponsesHttpUrl, response.requestOptions.uri.toString());
            addLogic(sHttpResponses, data);
          } catch (e) {
            if (kDebugMode) {
              print(e);
            }
          }
        }
    }
    return super.onResponse(response, handler);
  }

  @override
  onError(DioException err, handler) async {
    if (kDebugMode) {
      if (kDebugMode) {
        LoggerUtil.e('请求异常: $err');
        LoggerUtil.e('请求异常信息: ${err.response?.toString() ?? ""}');
      }
    }
    try {
      addLogic(sHttpErrorUrl, err.requestOptions.path);
      var errors = <String, dynamic>{};
      errors["error"] = err.message;
      addLogic(sHttpError, errors);
    } catch (e) {
      if (kDebugMode) {
        LoggerUtil.e(e);
      }
    }
    return super.onError(err, handler);
  }

  static addLogic(List list, data) {
    if (list.length > 20) {
      list.removeAt(0);
    }
    list.add(data);
  }
}