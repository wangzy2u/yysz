class ConsignmentOrderListBean {
  ConsignmentOrderListBean({
      List<ConsignmentOrderListItemBean>? content,
      num? pageNum, 
      num? pageSize, 
      num? size, 
      num? total, 
      num? totalPage,}){
    _content = content;
    _pageNum = pageNum;
    _pageSize = pageSize;
    _size = size;
    _total = total;
    _totalPage = totalPage;
}

  ConsignmentOrderListBean.fromJson(dynamic json) {
    if (json['content'] != null) {
      _content = [];
      json['content'].forEach((v) {
        _content?.add(ConsignmentOrderListItemBean.fromJson(v));
      });
    }
    _pageNum = json['pageNum'];
    _pageSize = json['pageSize'];
    _size = json['size'];
    _total = json['total'];
    _totalPage = json['totalPage'];
  }
  List<ConsignmentOrderListItemBean>? _content;
  num? _pageNum;
  num? _pageSize;
  num? _size;
  num? _total;
  num? _totalPage;

  List<ConsignmentOrderListItemBean>? get content => _content;
  num? get pageNum => _pageNum;
  num? get pageSize => _pageSize;
  num? get size => _size;
  num? get total => _total;
  num? get totalPage => _totalPage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_content != null) {
      map['content'] = _content?.map((v) => v.toJson()).toList();
    }
    map['pageNum'] = _pageNum;
    map['pageSize'] = _pageSize;
    map['size'] = _size;
    map['total'] = _total;
    map['totalPage'] = _totalPage;
    return map;
  }

}

class ConsignmentOrderListItemBean {
  ConsignmentOrderListItemBean({
    String? collectionCover,
    String? collectionId,
    String? collectionName,
    String? commodityType,
    String? id,
    String? memberId,
    String? orderNo,
    String? resaleDate,
    num? resalePrice,
    String? soldDate,
    String? state,}){
    _collectionCover = collectionCover;
    _collectionId = collectionId;
    _collectionName = collectionName;
    _commodityType = commodityType;
    _id = id;
    _memberId = memberId;
    _orderNo = orderNo;
    _resaleDate = resaleDate;
    _resalePrice = resalePrice;
    _soldDate = soldDate;
    _state = state;
  }

  ConsignmentOrderListItemBean.fromJson(dynamic json) {
    _collectionCover = json['collectionCover'];
    _collectionId = json['collectionId'];
    _collectionName = json['collectionName'];
    _commodityType = json['commodityType'];
    _id = json['id'];
    _memberId = json['memberId'];
    _orderNo = json['orderNo'];
    _resaleDate = json['resaleDate'];
    _resalePrice = json['resalePrice'];
    _soldDate = json['soldDate'];
    _state = json['state'];
  }
  String? _collectionCover;
  String? _collectionId;
  String? _collectionName;
  String? _commodityType;
  String? _id;
  String? _memberId;
  String? _orderNo;
  String? _resaleDate;
  num? _resalePrice;
  String? _soldDate;
  String? _state;

  String? get collectionCover => _collectionCover;
  String? get collectionId => _collectionId;
  String? get collectionName => _collectionName;
  String? get commodityType => _commodityType;
  String? get id => _id;
  String? get memberId => _memberId;
  String? get orderNo => _orderNo;
  String? get resaleDate => _resaleDate;
  num? get resalePrice => _resalePrice;
  String? get soldDate => _soldDate;
  String? get state => _state;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['collectionCover'] = _collectionCover;
    map['collectionId'] = _collectionId;
    map['collectionName'] = _collectionName;
    map['commodityType'] = _commodityType;
    map['id'] = _id;
    map['memberId'] = _memberId;
    map['orderNo'] = _orderNo;
    map['resaleDate'] = _resaleDate;
    map['resalePrice'] = _resalePrice;
    map['soldDate'] = _soldDate;
    map['state'] = _state;
    return map;
  }

}