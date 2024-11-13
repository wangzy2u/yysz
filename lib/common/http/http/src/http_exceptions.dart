import 'package:nft_flutter/common/http/http/dio_new.dart';

///请求异常
class DMRequestException extends HttpResponse {
  DMRequestException(int code, String message,{dynamic errorExpands}) : super.failure(code: code, msg: message,errorExpands: errorExpands);
}

///网络异常
class DMNetworkException extends DMRequestException {
  DMNetworkException(String message) : super(-1, '网络异常');
}

///授权异常
class DMUnauthorisedException extends DMRequestException {
  DMUnauthorisedException(int code, String message) : super(code, message);
}