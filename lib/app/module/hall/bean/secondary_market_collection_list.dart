class SecondaryMarketCollectionList {
  SecondaryMarketCollectionList({
      num? total, 
      List<SecondaryMarketCollectionBean>? list,
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

  SecondaryMarketCollectionList.fromJson(dynamic json) {
    _total = json['total'];
    if (json['list'] != null) {
      _list = [];
      json['list'].forEach((v) {
        _list?.add(SecondaryMarketCollectionBean.fromJson(v));
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
  List<SecondaryMarketCollectionBean>? _list;
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
  List<SecondaryMarketCollectionBean>? get list => _list;
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



class SecondaryMarketCollectionBean {
  SecondaryMarketCollectionBean({
    num? availableNum,
    String? collectionCover,
    String? collectionId,
    String? collectionName,
    num? commodityType,
    num? incubationLimit,
    String? issuerId,
    String? issuerName,
    num? minPrice,
    num? orderCount,
    num? quantity,
    String? seriesName,}){
    _availableNum = availableNum;
    _collectionCover = collectionCover;
    _collectionId = collectionId;
    _collectionName = collectionName;
    _commodityType = commodityType;
    _incubationLimit = incubationLimit;
    _issuerId = issuerId;
    _issuerName = issuerName;
    _minPrice = minPrice;
    _orderCount = orderCount;
    _quantity = quantity;
    _seriesName = seriesName;
  }

  SecondaryMarketCollectionBean.fromJson(dynamic json) {
    _availableNum = json['availableNum'];
    _collectionCover = json['collectionCover'];
    _collectionId = json['collectionId'];
    _collectionName = json['collectionName'];
    _commodityType = json['commodityType'];
    _incubationLimit = json['incubationLimit'];
    _issuerId = json['issuerId'];
    _issuerName = json['issuerName'];
    _minPrice = json['minPrice'];
    _orderCount = json['orderCount'];
    _quantity = json['quantity'];
    _seriesName = json['seriesName'];
  }
  num? _availableNum;
  String? _collectionCover;
  String? _collectionId;
  String? _collectionName;
  num? _commodityType;
  num? _incubationLimit;
  String? _issuerId;
  String? _issuerName;
  num? _minPrice;
  num? _orderCount;
  num? _quantity;
  String? _seriesName;

  num? get availableNum => _availableNum;
  String? get collectionCover => _collectionCover;
  String? get collectionId => _collectionId;
  String? get collectionName => _collectionName;
  num? get commodityType => _commodityType;
  num? get incubationLimit => _incubationLimit;
  String? get issuerId => _issuerId;
  String? get issuerName => _issuerName;
  num? get minPrice => _minPrice;
  num? get orderCount => _orderCount;
  num? get quantity => _quantity;
  String? get seriesName => _seriesName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['availableNum'] = _availableNum;
    map['collectionCover'] = _collectionCover;
    map['collectionId'] = _collectionId;
    map['collectionName'] = _collectionName;
    map['commodityType'] = _commodityType;
    map['incubationLimit'] = _incubationLimit;
    map['issuerId'] = _issuerId;
    map['issuerName'] = _issuerName;
    map['minPrice'] = _minPrice;
    map['orderCount'] = _orderCount;
    map['quantity'] = _quantity;
    map['seriesName'] = _seriesName;
    return map;
  }

}