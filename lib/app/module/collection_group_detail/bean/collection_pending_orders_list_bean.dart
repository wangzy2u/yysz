class CollectionPendingOrdersListBean {
  CollectionPendingOrdersListBean({
      num? total, 
      List<PendingOrderItemBean>? list,
      num? pageNum, 
      num? pageSize, 
      num? size, 
      num? startRow, 
      num? endRow, 
      num? pages, 
      num? prePage, 
      num? nextPage, 
      bool? isFirstPage, 
      bool? isLastPage, 
      bool? hasPreviousPage, 
      bool? hasNextPage, 
      num? navigatePages, 
      List<num>? navigatepageNums, 
      num? navigateFirstPage, 
      num? navigateLastPage,}){
    _total = total;
    _list = list;
    _pageNum = pageNum;
    _pageSize = pageSize;
    _size = size;
    _startRow = startRow;
    _endRow = endRow;
    _pages = pages;
    _prePage = prePage;
    _nextPage = nextPage;
    _isFirstPage = isFirstPage;
    _isLastPage = isLastPage;
    _hasPreviousPage = hasPreviousPage;
    _hasNextPage = hasNextPage;
    _navigatePages = navigatePages;
    _navigatepageNums = navigatepageNums;
    _navigateFirstPage = navigateFirstPage;
    _navigateLastPage = navigateLastPage;
}

  CollectionPendingOrdersListBean.fromJson(dynamic json) {
    _total = json['total'];
    if (json['list'] != null) {
      _list = [];
      json['list'].forEach((v) {
        _list?.add(PendingOrderItemBean.fromJson(v));
      });
    }
    _pageNum = json['pageNum'];
    _pageSize = json['pageSize'];
    _size = json['size'];
    _startRow = json['startRow'];
    _endRow = json['endRow'];
    _pages = json['pages'];
    _prePage = json['prePage'];
    _nextPage = json['nextPage'];
    _isFirstPage = json['isFirstPage'];
    _isLastPage = json['isLastPage'];
    _hasPreviousPage = json['hasPreviousPage'];
    _hasNextPage = json['hasNextPage'];
    _navigatePages = json['navigatePages'];
    _navigatepageNums = json['navigatepageNums'] != null ? json['navigatepageNums'].cast<num>() : [];
    _navigateFirstPage = json['navigateFirstPage'];
    _navigateLastPage = json['navigateLastPage'];
  }
  num? _total;
  List<PendingOrderItemBean>? _list;
  num? _pageNum;
  num? _pageSize;
  num? _size;
  num? _startRow;
  num? _endRow;
  num? _pages;
  num? _prePage;
  num? _nextPage;
  bool? _isFirstPage;
  bool? _isLastPage;
  bool? _hasPreviousPage;
  bool? _hasNextPage;
  num? _navigatePages;
  List<num>? _navigatepageNums;
  num? _navigateFirstPage;
  num? _navigateLastPage;

  num? get total => _total;
  List<PendingOrderItemBean>? get list => _list;
  num? get pageNum => _pageNum;
  num? get pageSize => _pageSize;
  num? get size => _size;
  num? get startRow => _startRow;
  num? get endRow => _endRow;
  num? get pages => _pages;
  num? get prePage => _prePage;
  num? get nextPage => _nextPage;
  bool? get isFirstPage => _isFirstPage;
  bool? get isLastPage => _isLastPage;
  bool? get hasPreviousPage => _hasPreviousPage;
  bool? get hasNextPage => _hasNextPage;
  num? get navigatePages => _navigatePages;
  List<num>? get navigatepageNums => _navigatepageNums;
  num? get navigateFirstPage => _navigateFirstPage;
  num? get navigateLastPage => _navigateLastPage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = _total;
    if (_list != null) {
      map['list'] = _list?.map((v) => v.toJson()).toList();
    }
    map['pageNum'] = _pageNum;
    map['pageSize'] = _pageSize;
    map['size'] = _size;
    map['startRow'] = _startRow;
    map['endRow'] = _endRow;
    map['pages'] = _pages;
    map['prePage'] = _prePage;
    map['nextPage'] = _nextPage;
    map['isFirstPage'] = _isFirstPage;
    map['isLastPage'] = _isLastPage;
    map['hasPreviousPage'] = _hasPreviousPage;
    map['hasNextPage'] = _hasNextPage;
    map['navigatePages'] = _navigatePages;
    map['navigatepageNums'] = _navigatepageNums;
    map['navigateFirstPage'] = _navigateFirstPage;
    map['navigateLastPage'] = _navigateLastPage;
    return map;
  }

}


class PendingOrderItemBean {
  PendingOrderItemBean({
    String? id,
    String? collectionId,
    String? collectionName,
    dynamic collectionCover,
    num? quantity,
    num? collectionSerialNumber,
    num? payWay,
    num? resalePrice,
    dynamic creatorName,
    String ? lockPayMemberId,}){
    _id = id;
    _collectionId = collectionId;
    _collectionName = collectionName;
    _collectionCover = collectionCover;
    _quantity = quantity;
    _collectionSerialNumber = collectionSerialNumber;
    _payWay = payWay;
    _resalePrice = resalePrice;
    _creatorName = creatorName;
    _lockPayMemberId = lockPayMemberId;
  }

  PendingOrderItemBean.fromJson(dynamic json) {
    _id = json['id'];
    _collectionId = json['collectionId'];
    _collectionName = json['collectionName'];
    _collectionCover = json['collectionCover'];
    _quantity = json['quantity'];
    _collectionSerialNumber = json['collectionSerialNumber'];
    _payWay = json['payWay'];
    _resalePrice = json['resalePrice'];
    _creatorName = json['creatorName'];
    _lockPayMemberId = json['lockPayMemberId'];
  }
  String? _id;
  String? _collectionId;
  String? _collectionName;
  dynamic _collectionCover;
  num? _quantity;
  num? _collectionSerialNumber;
  num? _payWay;
  num? _resalePrice;
  dynamic _creatorName;
  String? _lockPayMemberId;

  String? get id => _id;
  String? get collectionId => _collectionId;
  String? get collectionName => _collectionName;
  dynamic get collectionCover => _collectionCover;
  num? get quantity => _quantity;
  num? get collectionSerialNumber => _collectionSerialNumber;
  num? get payWay => _payWay;
  num? get resalePrice => _resalePrice;
  dynamic get creatorName => _creatorName;
  String? get lockPayMemberId => _lockPayMemberId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['collectionId'] = _collectionId;
    map['collectionName'] = _collectionName;
    map['collectionCover'] = _collectionCover;
    map['quantity'] = _quantity;
    map['collectionSerialNumber'] = _collectionSerialNumber;
    map['payWay'] = _payWay;
    map['resalePrice'] = _resalePrice;
    map['creatorName'] = _creatorName;
    map['lockPayMemberId'] = _lockPayMemberId;
    return map;
  }

}