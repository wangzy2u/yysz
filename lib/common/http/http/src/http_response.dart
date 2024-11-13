import 'http_exceptions.dart';

class HttpResponse {
  late bool success;
  dynamic? data;
  dynamic? errorExpands;
  String ? msg;
  int ? timestamp;
  int ? code;


  HttpResponse.success(this.data) {
    this.success = true;
  }

  HttpResponse.failure({
    this.code = -1,
    this.msg = '',
    this.data,
    this.errorExpands
  }) : success = false;
}