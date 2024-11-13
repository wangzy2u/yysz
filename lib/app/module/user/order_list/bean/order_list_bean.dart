
class OrderListBean {
  OrderListBean({
      num? pageNum, 
      num? pageSize, 
      num? totalPage, 
      num? total, 
      num? size, 
      List<OrderListItemBean>? content,}){
    _pageNum = pageNum;
    _pageSize = pageSize;
    _totalPage = totalPage;
    _total = total;
    _size = size;
    _content = content;
}

  OrderListBean.fromJson(dynamic json) {
    _pageNum = json['pageNum'];
    _pageSize = json['pageSize'];
    _totalPage = json['totalPage'];
    _total = json['total'];
    _size = json['size'];
    if (json['content'] != null) {
      _content = [];
      json['content'].forEach((v) {
        _content?.add(OrderListItemBean.fromJson(v));
      });
    }
  }
  num? _pageNum;
  num? _pageSize;
  num? _totalPage;
  num? _total;
  num? _size;
  List<OrderListItemBean>? _content;

  num? get pageNum => _pageNum;
  num? get pageSize => _pageSize;
  num? get totalPage => _totalPage;
  num? get total => _total;
  num? get size => _size;
  List<OrderListItemBean>? get content => _content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pageNum'] = _pageNum;
    map['pageSize'] = _pageSize;
    map['totalPage'] = _totalPage;
    map['total'] = _total;
    map['size'] = _size;
    if (_content != null) {
      map['content'] = _content?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class OrderListItemBean {
  OrderListItemBean({
    String? id,
    String? orderNo,
    String? commodityType,
    String? createTime,
    num? amount,
    String? state,
    String? stateName,
    String? collectionName,
    String? collectionCover,
    String? creatorName,
    String? productType,}){
    _id = id;
    _orderNo = orderNo;
    _commodityType = commodityType;
    _createTime = createTime;
    _amount = amount;
    _state = state;
    _stateName = stateName;
    _collectionName = collectionName;
    _collectionCover = collectionCover;
    _creatorName = creatorName;
    _productType = productType;
  }

  OrderListItemBean.fromJson(dynamic json) {
    _id = json['id'];
    _orderNo = json['orderNo'];
    _commodityType = json['commodityType'];
    _createTime = json['createTime'];
    _amount = json['amount'];
    _state = json['state'];
    _stateName = json['stateName'];
    _collectionName = json['collectionName'];
    _collectionCover = json['collectionCover'];
    _creatorName = json['creatorName'];
    _productType = json['productType'];
  }
  String? _id;
  String? _orderNo;
  String? _commodityType;
  String? _createTime;
  num? _amount;
  String? _state;
  String? _stateName;
  String? _collectionName;
  String? _collectionCover;
  String? _creatorName;
  String? _productType;

  String? get id => _id;
  String? get orderNo => _orderNo;
  String? get commodityType => _commodityType;
  String? get createTime => _createTime;
  num? get amount => _amount;
  String? get state => _state;
  String? get stateName => _stateName;
  String? get collectionName => _collectionName;
  String? get collectionCover => _collectionCover;
  String? get creatorName => _creatorName;
  String? get productType => _productType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['orderNo'] = _orderNo;
    map['commodityType'] = _commodityType;
    map['createTime'] = _createTime;
    map['amount'] = _amount;
    map['state'] = _state;
    map['stateName'] = _stateName;
    map['collectionName'] = _collectionName;
    map['collectionCover'] = _collectionCover;
    map['creatorName'] = _creatorName;
    map['productType'] = _productType;
    return map;
  }

}