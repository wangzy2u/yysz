class PayRegisterStateBean {
  PayRegisterStateBean({
      String? accountId, 
      String? address, 
      String? authType, 
      String? gmtCreate, 
      String? gmtModified, 
      num? id, 
      String? idCardNo, 
      num? lianlianWalletStatus, 
      String? mobile, 
      String? remark, 
      String? requestNo, 
      num? status, 
      String? userName, 
      num? yiabaoWalletStatus, 
      String? yibaoUserNo,}){
    _accountId = accountId;
    _address = address;
    _authType = authType;
    _gmtCreate = gmtCreate;
    _gmtModified = gmtModified;
    _id = id;
    _idCardNo = idCardNo;
    _lianlianWalletStatus = lianlianWalletStatus;
    _mobile = mobile;
    _remark = remark;
    _requestNo = requestNo;
    _status = status;
    _userName = userName;
    _yiabaoWalletStatus = yiabaoWalletStatus;
    _yibaoUserNo = yibaoUserNo;
}

  PayRegisterStateBean.fromJson(dynamic json) {
    _accountId = json['accountId'];
    _address = json['address'];
    _authType = json['authType'];
    _gmtCreate = json['gmtCreate'];
    _gmtModified = json['gmtModified'];
    _id = json['id'];
    _idCardNo = json['idCardNo'];
    _lianlianWalletStatus = json['lianlianWalletStatus'];
    _mobile = json['mobile'];
    _remark = json['remark'];
    _requestNo = json['requestNo'];
    _status = json['status'];
    _userName = json['userName'];
    _yiabaoWalletStatus = json['yiabaoWalletStatus'];
    _yibaoUserNo = json['yibaoUserNo'];
  }
  String? _accountId;
  String? _address;
  String? _authType;
  String? _gmtCreate;
  String? _gmtModified;
  num? _id;
  String? _idCardNo;
  num? _lianlianWalletStatus;
  String? _mobile;
  String? _remark;
  String? _requestNo;
  num? _status;
  String? _userName;
  num? _yiabaoWalletStatus;
  String? _yibaoUserNo;

  String? get accountId => _accountId;
  String? get address => _address;
  String? get authType => _authType;
  String? get gmtCreate => _gmtCreate;
  String? get gmtModified => _gmtModified;
  num? get id => _id;
  String? get idCardNo => _idCardNo;
  num? get lianlianWalletStatus => _lianlianWalletStatus;
  String? get mobile => _mobile;
  String? get remark => _remark;
  String? get requestNo => _requestNo;
  num? get status => _status;
  String? get userName => _userName;
  num? get yiabaoWalletStatus => _yiabaoWalletStatus;
  String? get yibaoUserNo => _yibaoUserNo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['accountId'] = _accountId;
    map['address'] = _address;
    map['authType'] = _authType;
    map['gmtCreate'] = _gmtCreate;
    map['gmtModified'] = _gmtModified;
    map['id'] = _id;
    map['idCardNo'] = _idCardNo;
    map['lianlianWalletStatus'] = _lianlianWalletStatus;
    map['mobile'] = _mobile;
    map['remark'] = _remark;
    map['requestNo'] = _requestNo;
    map['status'] = _status;
    map['userName'] = _userName;
    map['yiabaoWalletStatus'] = _yiabaoWalletStatus;
    map['yibaoUserNo'] = _yibaoUserNo;
    return map;
  }

}