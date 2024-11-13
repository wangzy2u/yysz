// 成功回调
import 'dart:io';

import 'package:dio/dio.dart';

import '../dio_new.dart';
import 'default_http_transformer.dart';
import 'http_transformer.dart';

HttpResponse handleResponse(Response? response,
    {HttpTransformer? httpTransformer}) {
  httpTransformer ??= DefaultHttpTransformer.getInstance();

  //返回值空异常
  if (response == null) {
    return DMRequestException(-1, '返回值空异常');
  }


  // 接口调用成功
  if (_isRequestSuccess(response.statusCode)) {
    return httpTransformer.parse(response);
  } else {
    // 接口调用失败
    return DMRequestException(response.statusCode??-1, response.statusMessage??'' );
  }
}

HttpResponse handleException(Exception exception) {
  var parseException = _parseException(exception);
  return parseException;
}

/// 鉴权失败
bool _isTokenTimeout(int? code) {
  return code == 401;
}

/// 请求成功
bool _isRequestSuccess(int? statusCode) {
  return (statusCode != null && statusCode >= 200 && statusCode < 300);
}

DMRequestException _parseException(Exception error) {
  if (error is DioException) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:

      case DioExceptionType.cancel:
      return DMNetworkException(error.message ?? '');
      case DioExceptionType.badResponse:
        try {
          int? errCode = error.response?.statusCode;
          switch (errCode) {
            case 400:
              return DMRequestException(errCode ?? -1,'请求语法错误');
            case 401:
              return DMRequestException(errCode ?? -1,'没有权限');
            case 403:
              return DMRequestException(errCode ?? -1,'服务器拒绝执行');
            case 404:
              return DMRequestException(errCode ?? -1,'无法连接服务器');
            case 405:
              return DMRequestException(errCode ?? -1,'请求方法被禁止');
            case 500:
              return DMRequestException(errCode ?? -1,'服务器内部错误');
            case 502:
              return DMRequestException(errCode ?? -1,'无效的请求');
            case 503:
              return DMRequestException(errCode ?? -1,'服务器挂了');
            case 505:
              return DMRequestException(errCode ?? -1,'不支持HTTP协议请求');
            default:
              return DMRequestException(-1,error.message ?? '');
          }
        } on Exception catch (_) {
          return DMRequestException(-1,error.message ?? '');
        }

      case DioExceptionType.connectionError:
        if (error.error is SocketException) {
          return DMNetworkException(error.message ?? '');
        } else {
          return DMNetworkException(error.message ?? '');
        }
      default:
        return DMNetworkException(error.message ?? '');
    }
  } else {
    return DMNetworkException(error.toString());
  }
}