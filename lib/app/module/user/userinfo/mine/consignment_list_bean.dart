class ConsignmentListBean {
  ConsignmentListBean({
      List<ConsignmentListItemBean>? content,
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

  ConsignmentListBean.fromJson(dynamic json) {
    if (json['content'] != null) {
      _content = [];
      json['content'].forEach((v) {
        _content?.add(ConsignmentListItemBean.fromJson(v));
      });
    }
    _pageNum = json['pageNum'];
    _pageSize = json['pageSize'];
    _size = json['size'];
    _total = json['total'];
    _totalPage = json['totalPage'];
  }
  List<ConsignmentListItemBean>? _content;
  num? _pageNum;
  num? _pageSize;
  num? _size;
  num? _total;
  num? _totalPage;

  List<ConsignmentListItemBean>? get content => _content;
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

class ConsignmentListItemBean {
  ConsignmentListItemBean({
    num? buyPrice,
    String? collectionCover,
    String? collectionId,
    String? collectionName,
    num? collectionSerialNumber,
    num? enableResale,
    String? holdDate,
    num? holdDay,
    String? id,
    num? isResale,
    num? preventCollectionPrice,
    num? quantity,
    String? resaleId,
    String? state,}){
    _buyPrice = buyPrice;
    _collectionCover = collectionCover;
    _collectionId = collectionId;
    _collectionName = collectionName;
    _collectionSerialNumber = collectionSerialNumber;
    _enableResale = enableResale;
    _holdDate = holdDate;
    _holdDay = holdDay;
    _id = id;
    _isResale = isResale;
    _preventCollectionPrice = preventCollectionPrice;
    _quantity = quantity;
    _resaleId = resaleId;
    _state = state;
  }

  ConsignmentListItemBean.fromJson(dynamic json) {
    _buyPrice = json['buyPrice'];
    _collectionCover = json['collectionCover'];
    _collectionId = json['collectionId'];
    _collectionName = json['collectionName'];
    _collectionSerialNumber = json['collectionSerialNumber'];
    _enableResale = json['enableResale'];
    _holdDate = json['holdDate'];
    _holdDay = json['holdDay'];
    _id = json['id'];
    _isResale = json['isResale'];
    _preventCollectionPrice = json['preventCollectionPrice'];
    _quantity = json['quantity'];
    _resaleId = json['resaleId'];
    _state = json['state'];
  }
  num? _buyPrice;
  String? _collectionCover;
  String? _collectionId;
  String? _collectionName;
  num? _collectionSerialNumber;
  num? _enableResale;
  String? _holdDate;
  num? _holdDay;
  String? _id;
  num? _isResale;
  num? _preventCollectionPrice;
  num? _quantity;
  String? _resaleId;
  String? _state;

  num? get buyPrice => _buyPrice;
  String? get collectionCover => _collectionCover;
  String? get collectionId => _collectionId;
  String? get collectionName => _collectionName;
  num? get collectionSerialNumber => _collectionSerialNumber;
  num? get enableResale => _enableResale;
  String? get holdDate => _holdDate;
  num? get holdDay => _holdDay;
  String? get id => _id;
  num? get isResale => _isResale;
  num? get preventCollectionPrice => _preventCollectionPrice;
  num? get quantity => _quantity;
  String? get resaleId => _resaleId;
  String? get state => _state;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['buyPrice'] = _buyPrice;
    map['collectionCover'] = _collectionCover;
    map['collectionId'] = _collectionId;
    map['collectionName'] = _collectionName;
    map['collectionSerialNumber'] = _collectionSerialNumber;
    map['enableResale'] = _enableResale;
    map['holdDate'] = _holdDate;
    map['holdDay'] = _holdDay;
    map['id'] = _id;
    map['isResale'] = _isResale;
    map['preventCollectionPrice'] = _preventCollectionPrice;
    map['quantity'] = _quantity;
    map['resaleId'] = _resaleId;
    map['state'] = _state;
    return map;
  }

}