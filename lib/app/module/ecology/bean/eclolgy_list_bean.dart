class EclolgyListBean {
  EclolgyListBean({
      num? total, 
      List<EcologyItemBean>? list,
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

  EclolgyListBean.fromJson(dynamic json) {
    _total = json['total'];
    if (json['list'] != null) {
      _list = [];
      json['list'].forEach((v) {
        _list?.add(EcologyItemBean.fromJson(v));
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
  List<EcologyItemBean>? _list;
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
  List<EcologyItemBean>? get list => _list;
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



class EcologyItemBean {
  EcologyItemBean({
    String? collectionId,
    String? collectionCover,
    num? commodityType,
    String? collectionName,
    String? seriesName,
    String? issuerName,
    String? issuerId,
    num? minPrice,
    num? incubationPeriod,
    num? incubationLimit,
    num? dailyIncrease,
    num? orderCount,
    num? quantity,
    dynamic splitDay,}){
    _collectionId = collectionId;
    _collectionCover = collectionCover;
    _commodityType = commodityType;
    _collectionName = collectionName;
    _seriesName = seriesName;
    _issuerName = issuerName;
    _issuerId = issuerId;
    _minPrice = minPrice;
    _incubationPeriod = incubationPeriod;
    _incubationLimit = incubationLimit;
    _dailyIncrease = _dailyIncrease;
    _orderCount = orderCount;
    _quantity = quantity;
    _splitDay = splitDay;
  }

  EcologyItemBean.fromJson(dynamic json) {
    _collectionId = json['collectionId'];
    _collectionCover = json['collectionCover'];
    _commodityType = json['commodityType'];
    _collectionName = json['collectionName'];
    _seriesName = json['seriesName'];
    _issuerName = json['issuerName'];
    _issuerId = json['issuerId'];
    _minPrice = json['minPrice'];
    _incubationPeriod = json['incubationPeriod'];
    _incubationLimit = json['incubationLimit'];
    _dailyIncrease = json['dailyIncrease'];
    _orderCount = json['orderCount'];
    _quantity = json['quantity'];
    _splitDay = json['splitDay'];
  }
  String? _collectionId;
  String? _collectionCover;
  num? _commodityType;
  String? _collectionName;
  String? _seriesName;
  String? _issuerName;
  String? _issuerId;
  num? _minPrice;
  num? _incubationPeriod;
  num? _incubationLimit;
  num? _dailyIncrease;
  num? _orderCount;
  num? _quantity;
  dynamic _splitDay;

  String? get collectionId => _collectionId;
  String? get collectionCover => _collectionCover;
  num? get commodityType => _commodityType;
  String? get collectionName => _collectionName;
  String? get seriesName => _seriesName;
  String? get issuerName => _issuerName;
  String? get issuerId => _issuerId;
  num? get minPrice => _minPrice;
  num? get incubationPeriod => _incubationPeriod;
  num? get incubationLimit => _incubationLimit;
  num? get dailyIncrease => _dailyIncrease;
  num? get orderCount => _orderCount;
  num? get quantity => _quantity;
  dynamic get splitDay => _splitDay;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['collectionId'] = _collectionId;
    map['collectionCover'] = _collectionCover;
    map['commodityType'] = _commodityType;
    map['collectionName'] = _collectionName;
    map['seriesName'] = _seriesName;
    map['issuerName'] = _issuerName;
    map['issuerId'] = _issuerId;
    map['minPrice'] = _minPrice;
    map['incubationPeriod'] = _incubationPeriod;
    map['incubationLimit'] = _incubationLimit;
    map['dailyIncrease'] = _dailyIncrease;
    map['orderCount'] = _orderCount;
    map['quantity'] = _quantity;
    map['splitDay'] = _splitDay;
    return map;
  }

}