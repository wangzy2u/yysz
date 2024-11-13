class PayInfoBean {
  PayInfoBean({
      String? cashierUrl, 
      String? code, 
      String? message, 
      String? uniqueOrderNo,}){
    _cashierUrl = cashierUrl;
    _code = code;
    _message = message;
    _uniqueOrderNo = uniqueOrderNo;
}

  PayInfoBean.fromJson(dynamic json) {
    _cashierUrl = json['cashierUrl'];
    _code = json['code'];
    _message = json['message'];
    _uniqueOrderNo = json['uniqueOrderNo'];
  }
  String? _cashierUrl;
  String? _code;
  String? _message;
  String? _uniqueOrderNo;

  String? get cashierUrl => _cashierUrl;
  String? get code => _code;
  String? get message => _message;
  String? get uniqueOrderNo => _uniqueOrderNo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cashierUrl'] = _cashierUrl;
    map['code'] = _code;
    map['message'] = _message;
    map['uniqueOrderNo'] = _uniqueOrderNo;
    return map;
  }

}