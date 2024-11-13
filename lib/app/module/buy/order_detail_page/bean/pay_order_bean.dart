class PayOrderBean {
  PayOrderBean({
      String? id, 
      String? orderNo, 
      String? createTime,
    String? paidTime,
      num? surplusSecond, 
      num? amount, 
      String? state, 
      String? stateName, 
      String? collectionName, 
      String? collectionCover, 
      String? creatorName, 
      num? collectNumber, 
      num? unitPrice,}){
    _id = id;
    _orderNo = orderNo;
    _createTime = createTime;
    _paidTime = paidTime;
    _surplusSecond = surplusSecond;
    _amount = amount;
    _state = state;
    _stateName = stateName;
    _collectionName = collectionName;
    _collectionCover = collectionCover;
    _creatorName = creatorName;
    _collectNumber = collectNumber;
    _unitPrice = unitPrice;
}

  PayOrderBean.fromJson(dynamic json) {
    _id = json['id'];
    _orderNo = json['orderNo'];
    _createTime = json['createTime'];
    _paidTime = json['paidTime'];
    _surplusSecond = json['surplusSecond'];
    _amount = json['amount'];
    _state = json['state'];
    _stateName = json['stateName'];
    _collectionName = json['collectionName'];
    _collectionCover = json['collectionCover'];
    _creatorName = json['creatorName'];
    _collectNumber = json['collectNumber'];
    _unitPrice = json['unitPrice'];
  }
  String? _id;
  String? _orderNo;
  String? _createTime;
  String? _paidTime;
  num? _surplusSecond;
  num? _amount;
  String? _state;
  String? _stateName;
  String? _collectionName;
  String? _collectionCover;
  String? _creatorName;
  num? _collectNumber;
  num? _unitPrice;

  String? get id => _id;
  String? get orderNo => _orderNo;
  String? get createTime => _createTime;
  String? get paidTime => _paidTime;
  num? get surplusSecond => _surplusSecond;
  num? get amount => _amount;
  String? get state => _state;
  String? get stateName => _stateName;
  String? get collectionName => _collectionName;
  String? get collectionCover => _collectionCover;
  String? get creatorName => _creatorName;
  num? get collectNumber => _collectNumber;
  num? get unitPrice => _unitPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['orderNo'] = _orderNo;
    map['createTime'] = _createTime;
    map['paidTime'] = _paidTime;
    map['surplusSecond'] = _surplusSecond;
    map['amount'] = _amount;
    map['state'] = _state;
    map['stateName'] = _stateName;
    map['collectionName'] = _collectionName;
    map['collectionCover'] = _collectionCover;
    map['creatorName'] = _creatorName;
    map['collectNumber'] = _collectNumber;
    map['unitPrice'] = _unitPrice;
    return map;
  }

}