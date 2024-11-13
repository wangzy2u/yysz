class UserInfoBean {
  UserInfoBean({
      String? uid, 
      String? nickName, 
      String? realName, 
      String? bindRealNameTime,
      String? avatar,
      String? mobile, 
      String? blockChainAddr, 
      dynamic inviterName, 
      dynamic inviterMobile,
      dynamic inviterCount,
      dynamic walletOpenCount,
    int? authStatus,
      String? address, 
      dynamic cardType, 
      dynamic payPwd, 
      bool? isPayAccountLocked,
    double? cardBalance,
      String? latelyLoginTime,}){
    _uid = uid;
    _nickName = nickName;
    _realName = realName;
    _bindRealNameTime = bindRealNameTime;
    _avatar = avatar;
    _mobile = mobile;
    _blockChainAddr = blockChainAddr;
    _inviterName = inviterName;
    _inviterMobile = inviterMobile;
    _inviterCount = inviterCount;
    _walletOpenCount = walletOpenCount;
    _authStatus = authStatus;
    _address = address;
    _cardType = cardType;
    _payPwd = payPwd;
    _isPayAccountLocked = isPayAccountLocked;
    _cardBalance = cardBalance;
    _latelyLoginTime = latelyLoginTime;
}

  UserInfoBean.fromJson(dynamic json) {
    _uid = json['uid'];
    _nickName = json['nickName'];
    _realName = json['realName'];
    _bindRealNameTime = json['bindRealNameTime'];
    _avatar = json['avatar'];
    _mobile = json['mobile'];
    _blockChainAddr = json['blockChainAddr'];
    _inviterName = json['inviterName'];
    _inviterMobile = json['inviterMobile'];
    _inviterCount = json['inviterCount'];
    _walletOpenCount = json['walletOpenCount'];
    _authStatus = json['authStatus'];
    _address = json['address'];
    _cardType = json['cardType'];
    _payPwd = json['payPwd'];
    _isPayAccountLocked = json['isPayAccountLocked'];
    _cardBalance = json['cardBalance'];
    _latelyLoginTime = json['latelyLoginTime'];
  }
  String? _uid;
  String? _nickName;
  String? _realName;
  String? _bindRealNameTime;
  String? _avatar;
  String? _mobile;
  String? _blockChainAddr;
  dynamic _inviterName;
  dynamic _inviterMobile;
  dynamic _inviterCount;
  dynamic _walletOpenCount;
  int? _authStatus;
  String? _address;
  dynamic _cardType;
  dynamic _payPwd;
  bool? _isPayAccountLocked;
  double? _cardBalance;
  String? _latelyLoginTime;

  String? get uid => _uid;
  String? get nickName => _nickName;
  String? get realName => _realName;
  String? get bindRealNameTime => _bindRealNameTime;
  String? get avatar => _avatar;
  String? get mobile => _mobile;
  String? get blockChainAddr => _blockChainAddr;
  dynamic get inviterName => _inviterName;
  dynamic get inviterMobile => _inviterMobile;
  dynamic get inviterCount => _inviterCount;
  dynamic get walletOpenCount => _walletOpenCount;
  int? get authStatus => _authStatus;
  String? get address => _address;
  dynamic get cardType => _cardType;
  dynamic get payPwd => _payPwd;
  bool? get isPayAccountLocked => _isPayAccountLocked;
  double? get cardBalance => _cardBalance;
  String? get latelyLoginTime => _latelyLoginTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uid'] = _uid;
    map['nickName'] = _nickName;
    map['realName'] = _realName;
    map['bindRealNameTime'] = _bindRealNameTime;
    map['avatar'] = _avatar;
    map['mobile'] = _mobile;
    map['blockChainAddr'] = _blockChainAddr;
    map['inviterName'] = _inviterName;
    map['inviterMobile'] = _inviterMobile;
    map['inviterCount'] = _inviterCount;
    map['walletOpenCount'] = _walletOpenCount;
    map['authStatus'] = _authStatus;
    map['address'] = _address;
    map['cardType'] = _cardType;
    map['payPwd'] = _payPwd;
    map['isPayAccountLocked'] = _isPayAccountLocked;
    map['cardBalance'] = _cardBalance;
    map['latelyLoginTime'] = _latelyLoginTime;
    return map;
  }

}