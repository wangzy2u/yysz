class AirdropOrderListBean {
  AirdropOrderListBean({
      num? endRow, 
      bool? hasNextPage, 
      bool? hasPreviousPage, 
      bool? isFirstPage, 
      bool? isLastPage, 
      List<AirdropOrderListItemBean>? list,
      num? navigateFirstPage, 
      num? navigateLastPage, 
      num? navigatePages, 
      List<num>? navigatepageNums, 
      num? nextPage, 
      num? pageNum, 
      num? pageSize, 
      num? pages, 
      num? prePage, 
      num? size, 
      num? startRow, 
      num? total,}){
    _endRow = endRow;
    _hasNextPage = hasNextPage;
    _hasPreviousPage = hasPreviousPage;
    _isFirstPage = isFirstPage;
    _isLastPage = isLastPage;
    _list = list;
    _navigateFirstPage = navigateFirstPage;
    _navigateLastPage = navigateLastPage;
    _navigatePages = navigatePages;
    _navigatepageNums = navigatepageNums;
    _nextPage = nextPage;
    _pageNum = pageNum;
    _pageSize = pageSize;
    _pages = pages;
    _prePage = prePage;
    _size = size;
    _startRow = startRow;
    _total = total;
}

  AirdropOrderListBean.fromJson(dynamic json) {
    _endRow = json['endRow'];
    _hasNextPage = json['hasNextPage'];
    _hasPreviousPage = json['hasPreviousPage'];
    _isFirstPage = json['isFirstPage'];
    _isLastPage = json['isLastPage'];
    if (json['list'] != null) {
      _list = [];
      json['list'].forEach((v) {
        _list?.add(AirdropOrderListItemBean.fromJson(v));
      });
    }
    _navigateFirstPage = json['navigateFirstPage'];
    _navigateLastPage = json['navigateLastPage'];
    _navigatePages = json['navigatePages'];
    _navigatepageNums = json['navigatepageNums'] != null ? json['navigatepageNums'].cast<num>() : [];
    _nextPage = json['nextPage'];
    _pageNum = json['pageNum'];
    _pageSize = json['pageSize'];
    _pages = json['pages'];
    _prePage = json['prePage'];
    _size = json['size'];
    _startRow = json['startRow'];
    _total = json['total'];
  }
  num? _endRow;
  bool? _hasNextPage;
  bool? _hasPreviousPage;
  bool? _isFirstPage;
  bool? _isLastPage;
  List<AirdropOrderListItemBean>? _list;
  num? _navigateFirstPage;
  num? _navigateLastPage;
  num? _navigatePages;
  List<num>? _navigatepageNums;
  num? _nextPage;
  num? _pageNum;
  num? _pageSize;
  num? _pages;
  num? _prePage;
  num? _size;
  num? _startRow;
  num? _total;

  num? get endRow => _endRow;
  bool? get hasNextPage => _hasNextPage;
  bool? get hasPreviousPage => _hasPreviousPage;
  bool? get isFirstPage => _isFirstPage;
  bool? get isLastPage => _isLastPage;
  List<AirdropOrderListItemBean>? get list => _list;
  num? get navigateFirstPage => _navigateFirstPage;
  num? get navigateLastPage => _navigateLastPage;
  num? get navigatePages => _navigatePages;
  List<num>? get navigatepageNums => _navigatepageNums;
  num? get nextPage => _nextPage;
  num? get pageNum => _pageNum;
  num? get pageSize => _pageSize;
  num? get pages => _pages;
  num? get prePage => _prePage;
  num? get size => _size;
  num? get startRow => _startRow;
  num? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['endRow'] = _endRow;
    map['hasNextPage'] = _hasNextPage;
    map['hasPreviousPage'] = _hasPreviousPage;
    map['isFirstPage'] = _isFirstPage;
    map['isLastPage'] = _isLastPage;
    if (_list != null) {
      map['list'] = _list?.map((v) => v.toJson()).toList();
    }
    map['navigateFirstPage'] = _navigateFirstPage;
    map['navigateLastPage'] = _navigateLastPage;
    map['navigatePages'] = _navigatePages;
    map['navigatepageNums'] = _navigatepageNums;
    map['nextPage'] = _nextPage;
    map['pageNum'] = _pageNum;
    map['pageSize'] = _pageSize;
    map['pages'] = _pages;
    map['prePage'] = _prePage;
    map['size'] = _size;
    map['startRow'] = _startRow;
    map['total'] = _total;
    return map;
  }

}

class AirdropOrderListItemBean {
  AirdropOrderListItemBean({
    String? collectionCover,
    String? collectionId,
    String? collectionName,
    bool? isOnChain,
    num? number,
    String? orderDate,
    String? orderNo,}){
    _collectionCover = collectionCover;
    _collectionId = collectionId;
    _collectionName = collectionName;
    _isOnChain = isOnChain;
    _number = number;
    _orderDate = orderDate;
    _orderNo = orderNo;
  }

  AirdropOrderListItemBean.fromJson(dynamic json) {
    _collectionCover = json['collectionCover'];
    _collectionId = json['collectionId'];
    _collectionName = json['collectionName'];
    _isOnChain = json['isOnChain'];
    _number = json['number'];
    _orderDate = json['orderDate'];
    _orderNo = json['orderNo'];
  }
  String? _collectionCover;
  String? _collectionId;
  String? _collectionName;
  bool? _isOnChain;
  num? _number;
  String? _orderDate;
  String? _orderNo;

  String? get collectionCover => _collectionCover;
  String? get collectionId => _collectionId;
  String? get collectionName => _collectionName;
  bool? get isOnChain => _isOnChain;
  num? get number => _number;
  String? get orderDate => _orderDate;
  String? get orderNo => _orderNo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['collectionCover'] = _collectionCover;
    map['collectionId'] = _collectionId;
    map['collectionName'] = _collectionName;
    map['isOnChain'] = _isOnChain;
    map['number'] = _number;
    map['orderDate'] = _orderDate;
    map['orderNo'] = _orderNo;
    return map;
  }

}