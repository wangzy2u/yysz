
class AssetsListBean {
  AssetsListBean({
      int? pageNum, 
      int? pageSize, 
      int? totalPage, 
      int? total, 
      int? size, 
      List<AssetsListBeanItemBean>? content,}){
    _pageNum = pageNum;
    _pageSize = pageSize;
    _totalPage = totalPage;
    _total = total;
    _size = size;
    _content = content;
}

  AssetsListBean.fromJson(dynamic json) {
    _pageNum = json['pageNum'];
    _pageSize = json['pageSize'];
    _totalPage = json['totalPage'];
    _total = json['total'];
    _size = json['size'];
    if (json['content'] != null) {
      _content = [];
      json['content'].forEach((v) {
        _content?.add(AssetsListBeanItemBean.fromJson(v));
      });
    }
  }
  int? _pageNum;
  int? _pageSize;
  int? _totalPage;
  int? _total;
  int? _size;
  List<AssetsListBeanItemBean>? _content;

  int? get pageNum => _pageNum;
  int? get pageSize => _pageSize;
  int? get totalPage => _totalPage;
  int? get total => _total;
  int? get size => _size;
  List<AssetsListBeanItemBean>? get content => _content;

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


class AssetsListBeanItemBean {
  AssetsListBeanItemBean({
    String? id,
    String? commodityType,
    int? workType,
    String? workTypeName,
    String? cover,
    int? coverDisplayType,
    String? coverDisplayTypeName,
    String? name,
    int? quantity,
    String? seriesId,
    int? reserve,
    String? saleTime,
    double? price,
    int? singlePersonLimit,
    int? singleOrderLimit,
    String? issuerId,
    int? showIssuer,
    int? isIssuer,
    dynamic issuerProfitRatio,
    String? creatorId,
    dynamic showCreator,
    dynamic creatorShareRatio,
    dynamic details,
    dynamic splitPrice,
    dynamic incubationPeriod,
    dynamic incubationLimit,
    dynamic splitFactor,
    dynamic dailyIncrease,
    String? collectionHash,
    int? stock,
    int? onShelf,
    dynamic saleRule,
    bool? externalSaleFlag,
    bool? preSaleFlag,
    dynamic showCollectionStory,
    String? commodityTypeName,
    String? createTime,
    String? creatorName,
    String? creatorIntroduce,
    String? issuerName,
    String? issuerIntroduce,
    String? seriesName,
    List<CollectionStorys>? collectionStorys,
    dynamic sellNum,
    dynamic saleState,
    dynamic sellMemberNum,
    dynamic maxResalePrice,
    dynamic minResalePrice,}){
    _id = id;
    _commodityType = commodityType;
    _workType = workType;
    _workTypeName = workTypeName;
    _cover = cover;
    _coverDisplayType = coverDisplayType;
    _coverDisplayTypeName = coverDisplayTypeName;
    _name = name;
    _quantity = quantity;
    _seriesId = seriesId;
    _reserve = reserve;
    _saleTime = saleTime;
    _price = price;
    _singlePersonLimit = singlePersonLimit;
    _singleOrderLimit = singleOrderLimit;
    _issuerId = issuerId;
    _showIssuer = showIssuer;
    _isIssuer = isIssuer;
    _issuerProfitRatio = issuerProfitRatio;
    _creatorId = creatorId;
    _showCreator = showCreator;
    _creatorShareRatio = creatorShareRatio;
    _details = details;
    _splitPrice = splitPrice;
    _incubationPeriod = incubationPeriod;
    _incubationLimit = incubationLimit;
    _splitFactor = splitFactor;
    _dailyIncrease = dailyIncrease;
    _collectionHash = collectionHash;
    _stock = stock;
    _onShelf = onShelf;
    _saleRule = saleRule;
    _externalSaleFlag = externalSaleFlag;
    _preSaleFlag = preSaleFlag;
    _showCollectionStory = showCollectionStory;
    _commodityTypeName = commodityTypeName;
    _createTime = createTime;
    _creatorName = creatorName;
    _creatorIntroduce = creatorIntroduce;
    _issuerName = issuerName;
    _issuerIntroduce = issuerIntroduce;
    _seriesName = seriesName;
    _collectionStorys = collectionStorys;
    _sellNum = sellNum;
    _saleState = saleState;
    _sellMemberNum = sellMemberNum;
    _maxResalePrice = maxResalePrice;
    _minResalePrice = minResalePrice;
  }

  AssetsListBeanItemBean.fromJson(dynamic json) {
    _id = json['id'];
    _commodityType = json['commodityType'];
    _workType = json['workType'];
    _workTypeName = json['workTypeName'];
    _cover = json['cover'];
    _coverDisplayType = json['coverDisplayType'];
    _coverDisplayTypeName = json['coverDisplayTypeName'];
    _name = json['name'];
    _quantity = json['quantity'];
    _seriesId = json['seriesId'];
    _reserve = json['reserve'];
    _saleTime = json['saleTime'];
    _price = json['price'];
    _singlePersonLimit = json['singlePersonLimit'];
    _singleOrderLimit = json['singleOrderLimit'];
    _issuerId = json['issuerId'];
    _showIssuer = json['showIssuer'];
    _isIssuer = json['isIssuer'];
    _issuerProfitRatio = json['issuerProfitRatio'];
    _creatorId = json['creatorId'];
    _showCreator = json['showCreator'];
    _creatorShareRatio = json['creatorShareRatio'];
    _details = json['details'];
    _splitPrice = json['splitPrice'];
    _incubationPeriod = json['incubationPeriod'];
    _incubationLimit = json['incubationLimit'];
    _splitFactor = json['splitFactor'];
    _dailyIncrease = json['dailyIncrease'];
    _collectionHash = json['collectionHash'];
    _stock = json['stock'];
    _onShelf = json['onShelf'];
    _saleRule = json['saleRule'];
    _externalSaleFlag = json['externalSaleFlag'];
    _preSaleFlag = json['preSaleFlag'];
    _showCollectionStory = json['showCollectionStory'];
    _commodityTypeName = json['commodityTypeName'];
    _createTime = json['createTime'];
    _creatorName = json['creatorName'];
    _creatorIntroduce = json['creatorIntroduce'];
    _issuerName = json['issuerName'];
    _issuerIntroduce = json['issuerIntroduce'];
    _seriesName = json['seriesName'];
    if (json['collectionStorys'] != null) {
      _collectionStorys = [];
      json['collectionStorys'].forEach((v) {
        _collectionStorys?.add(CollectionStorys.fromJson(v));
      });
    }
    _sellNum = json['sellNum'];
    _saleState = json['saleState'];
    _sellMemberNum = json['sellMemberNum'];
    _maxResalePrice = json['maxResalePrice'];
    _minResalePrice = json['minResalePrice'];
  }
  String? _id;
  String? _commodityType;
  int? _workType;
  String? _workTypeName;
  String? _cover;
  int? _coverDisplayType;
  String? _coverDisplayTypeName;
  String? _name;
  int? _quantity;
  String? _seriesId;
  int? _reserve;
  String? _saleTime;
  double? _price;
  int? _singlePersonLimit;
  int? _singleOrderLimit;
  String? _issuerId;
  int? _showIssuer;
  int? _isIssuer;
  dynamic _issuerProfitRatio;
  String? _creatorId;
  dynamic _showCreator;
  dynamic _creatorShareRatio;
  dynamic _details;
  dynamic _splitPrice;
  dynamic _incubationPeriod;
  dynamic _incubationLimit;
  dynamic _splitFactor;
  dynamic _dailyIncrease;
  String? _collectionHash;
  int? _stock;
  int? _onShelf;
  dynamic _saleRule;
  bool? _externalSaleFlag;
  bool? _preSaleFlag;
  dynamic _showCollectionStory;
  String? _commodityTypeName;
  String? _createTime;
  String? _creatorName;
  String? _creatorIntroduce;
  String? _issuerName;
  String? _issuerIntroduce;
  String? _seriesName;
  List<CollectionStorys>? _collectionStorys;
  dynamic _sellNum;
  dynamic _saleState;
  dynamic _sellMemberNum;
  dynamic _maxResalePrice;
  dynamic _minResalePrice;

  String? get id => _id;
  String? get commodityType => _commodityType;
  int? get workType => _workType;
  String? get workTypeName => _workTypeName;
  String? get cover => _cover;
  int? get coverDisplayType => _coverDisplayType;
  String? get coverDisplayTypeName => _coverDisplayTypeName;
  String? get name => _name;
  int? get quantity => _quantity;
  String? get seriesId => _seriesId;
  int? get reserve => _reserve;
  String? get saleTime => _saleTime;
  double? get price => _price;
  int? get singlePersonLimit => _singlePersonLimit;
  int? get singleOrderLimit => _singleOrderLimit;
  String? get issuerId => _issuerId;
  int? get showIssuer => _showIssuer;
  int? get isIssuer => _isIssuer;
  dynamic get issuerProfitRatio => _issuerProfitRatio;
  String? get creatorId => _creatorId;
  dynamic get showCreator => _showCreator;
  dynamic get creatorShareRatio => _creatorShareRatio;
  dynamic get details => _details;
  dynamic get splitPrice => _splitPrice;
  dynamic get incubationPeriod => _incubationPeriod;
  dynamic get incubationLimit => _incubationLimit;
  dynamic get splitFactor => _splitFactor;
  dynamic get dailyIncrease => _dailyIncrease;
  String? get collectionHash => _collectionHash;
  int? get stock => _stock;
  int? get onShelf => _onShelf;
  dynamic get saleRule => _saleRule;
  bool? get externalSaleFlag => _externalSaleFlag;
  bool? get preSaleFlag => _preSaleFlag;
  dynamic get showCollectionStory => _showCollectionStory;
  String? get commodityTypeName => _commodityTypeName;
  String? get createTime => _createTime;
  String? get creatorName => _creatorName;
  String? get creatorIntroduce => _creatorIntroduce;
  String? get issuerName => _issuerName;
  String? get issuerIntroduce => _issuerIntroduce;
  String? get seriesName => _seriesName;
  List<CollectionStorys>? get collectionStorys => _collectionStorys;
  dynamic get sellNum => _sellNum;
  dynamic get saleState => _saleState;
  dynamic get sellMemberNum => _sellMemberNum;
  dynamic get maxResalePrice => _maxResalePrice;
  dynamic get minResalePrice => _minResalePrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['commodityType'] = _commodityType;
    map['workType'] = _workType;
    map['workTypeName'] = _workTypeName;
    map['cover'] = _cover;
    map['coverDisplayType'] = _coverDisplayType;
    map['coverDisplayTypeName'] = _coverDisplayTypeName;
    map['name'] = _name;
    map['quantity'] = _quantity;
    map['seriesId'] = _seriesId;
    map['reserve'] = _reserve;
    map['saleTime'] = _saleTime;
    map['price'] = _price;
    map['singlePersonLimit'] = _singlePersonLimit;
    map['singleOrderLimit'] = _singleOrderLimit;
    map['issuerId'] = _issuerId;
    map['showIssuer'] = _showIssuer;
    map['isIssuer'] = _isIssuer;
    map['issuerProfitRatio'] = _issuerProfitRatio;
    map['creatorId'] = _creatorId;
    map['showCreator'] = _showCreator;
    map['creatorShareRatio'] = _creatorShareRatio;
    map['details'] = _details;
    map['splitPrice'] = _splitPrice;
    map['incubationPeriod'] = _incubationPeriod;
    map['incubationLimit'] = _incubationLimit;
    map['splitFactor'] = _splitFactor;
    map['dailyIncrease'] = _dailyIncrease;
    map['collectionHash'] = _collectionHash;
    map['stock'] = _stock;
    map['onShelf'] = _onShelf;
    map['saleRule'] = _saleRule;
    map['externalSaleFlag'] = _externalSaleFlag;
    map['preSaleFlag'] = _preSaleFlag;
    map['showCollectionStory'] = _showCollectionStory;
    map['commodityTypeName'] = _commodityTypeName;
    map['createTime'] = _createTime;
    map['creatorName'] = _creatorName;
    map['creatorIntroduce'] = _creatorIntroduce;
    map['issuerName'] = _issuerName;
    map['issuerIntroduce'] = _issuerIntroduce;
    map['seriesName'] = _seriesName;
    if (_collectionStorys != null) {
      map['collectionStorys'] = _collectionStorys?.map((v) => v.toJson()).toList();
    }
    map['sellNum'] = _sellNum;
    map['saleState'] = _saleState;
    map['sellMemberNum'] = _sellMemberNum;
    map['maxResalePrice'] = _maxResalePrice;
    map['minResalePrice'] = _minResalePrice;
    return map;
  }

}


class CollectionStorys {
  CollectionStorys({
    String? picLink,}){
    _picLink = picLink;
  }

  CollectionStorys.fromJson(dynamic json) {
    _picLink = json['picLink'];
  }
  String? _picLink;

  String? get picLink => _picLink;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['picLink'] = _picLink;
    return map;
  }

}