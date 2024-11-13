class LoginResultBean {
  LoginResultBean({
      String? tokenName, 
      String? tokenValue, 
      String? accountId,}){
    _tokenName = tokenName;
    _tokenValue = tokenValue;
    _accountId = accountId;
}

  LoginResultBean.fromJson(dynamic json) {
    _tokenName = json['tokenName'];
    _tokenValue = json['tokenValue'];
    _accountId = json['accountId'];
  }
  String? _tokenName;
  String? _tokenValue;
  String? _accountId;

  String? get tokenName => _tokenName;
  String? get tokenValue => _tokenValue;
  String? get accountId => _accountId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['tokenName'] = _tokenName;
    map['tokenValue'] = _tokenValue;
    map['accountId'] = _accountId;
    return map;
  }

}