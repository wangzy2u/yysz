import 'dart:convert';

import 'package:nft_flutter/app/network/transformer.dart';
import 'package:nft_flutter/common/http/http/dio_new.dart';

import '../../common/index.dart';
import '../../common/utils/date_util.dart';




const kAccessToken = 'access_token';
const kAccountId= 'accountId';
const kRefreshToken = 'refresh_token';
class NetworkManager {


  static const contentTypeForm = 'application/x-www-form-urlencoded';
  static const contentTypeJson = 'application/json';

  static final NetworkManager _instance = NetworkManager._internal();

  String get token {
    var token = SpUtil.getString(kAccessToken);
    return token ?? '';
  }

  set token(String token) {
    SpUtil.putString(kAccessToken, token);
  }

  String get accountId {
    var accountId = SpUtil.getString(kAccountId);
    return accountId ?? '';
  }

  set accountId(String accountId) {
    SpUtil.putString(kAccountId, accountId);
  }


  String get refreshToken {
    var token = SpUtil.getString(kRefreshToken);
    return token ?? '';
  }

  set refreshToken(String token) {
    SpUtil.putString(kRefreshToken, token);
  }

  factory NetworkManager() => _instance;

  NetworkManager._internal();

  Future<HttpResponse> post(
    String url, {
    Map<String, dynamic>? params,
    HttpTransformer? httpTransformer,
        String? contentType,
  }) async {
    final client = Get.find<HttpClient>();
    ///设置token
    client.setHeader('Nft_token', token);
    client.setHeader('Content-type', contentType?? contentTypeForm);

    httpTransformer ??= DMDefaultTransformer.getInstance();

    HttpResponse response = await client.post(url, httpTransformer: httpTransformer, data: params);
    if (response is DMRequestException) {
      throw response;
    }
    return response;
  }

  Future<HttpResponse> postUploadFile(
      String url, {
        FormData? formData,
        HttpTransformer? httpTransformer,
        String? contentType,
      }) async {
    final client = Get.find<HttpClient>();
    ///设置token
    client.setHeader('Nft_token', token);
    client.setHeader('Content-type', contentType?? contentTypeForm);
    httpTransformer ??= DMDefaultTransformer.getInstance();
    HttpResponse response = await client.post(url, httpTransformer: httpTransformer, data: formData);
    if (response is DMRequestException) {
      throw response;
    }
    return response;
  }

  Future<HttpResponse> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    HttpTransformer? httpTransformer,
        String? contentType,
  }) async {
    final client = Get.find<HttpClient>();

    ///设置token
    client.setHeader('Nft_token', token);
    client.setHeader('Content-type', contentType ?? contentTypeForm);

    httpTransformer ??= DMDefaultTransformer.getInstance();

    HttpResponse response = await client.get(url, httpTransformer: httpTransformer, queryParameters: queryParameters);
    if (response is DMRequestException) {
      throw response;
    }
    return response;
  }
}
