class SecondaryCollectionDetailBean {
  SecondaryCollectionDetailBean({
    num? availableNum,
    String? collectionCover,
    num? collectionDailyIncrease,
    String? collectionHash,
    num? collectionIncubationLimit,
    String? collectionName,
    String? collectionSaleRule,
    num? collectionSerialNumber,
    num? collectionStartPrice,
    String? collectionStartTime,
    String? commodityType,
    String? creatorId,
    String? creatorName,
    num? guidingPrice,
    String? holderAvatar,
    String? holderBlockChainAddr,
    String? holderNickName,
    String? id,
    num? incubationPeriod,
    String? issuedCollectionId,
    String? issuerId,
    String? issuerIntroduce,
    String? issuerLogo,
    String? issuerName,
    num? payWay,
    num? quantity,
    String? resaleDate,
    String? resaleMemberId,
    num? resalePrice,
    String? sellerName,
    String? seriesId,
    String? seriesName,
    String? state,
    List<String>? storyPicLinks,
    List<dynamic>? subCommoditys,
    String? transactionHash,
    String? uniqueId,
    String? holderId,
    num? incubationLimit,
    String? introduce,
    String? issUserName,
    String? logo,
    num? price,
    num? resaleLimitDay,
    num? resaleLimitPeople,
    String? saleTime,
    num? showIssuer,
    num? buyPrice,
    String? collectionId,
    num? dailyIncrease,
    num? enableResale,
    num? latestTransactionPrice,
    num? preventCollectionPrice,
    String? saleRule,}){
    _availableNum = availableNum;
    _collectionCover = collectionCover;
    _collectionDailyIncrease = collectionDailyIncrease;
    _collectionHash = collectionHash;
    _collectionIncubationLimit = collectionIncubationLimit;
    _collectionName = collectionName;
    _collectionSaleRule = collectionSaleRule;
    _collectionSerialNumber = collectionSerialNumber;
    _collectionStartPrice = collectionStartPrice;
    _collectionStartTime = collectionStartTime;
    _commodityType = commodityType;
    _creatorId = creatorId;
    _creatorName = creatorName;
    _guidingPrice = guidingPrice;
    _holderAvatar = holderAvatar;
    _holderBlockChainAddr = holderBlockChainAddr;
    _holderNickName = holderNickName;
    _id = id;
    _incubationPeriod = incubationPeriod;
    _issuedCollectionId = issuedCollectionId;
    _issuerId = issuerId;
    _issuerIntroduce = issuerIntroduce;
    _issuerLogo = issuerLogo;
    _issuerName = issuerName;
    _payWay = payWay;
    _quantity = quantity;
    _resaleDate = resaleDate;
    _resaleMemberId = resaleMemberId;
    _resalePrice = resalePrice;
    _sellerName = sellerName;
    _seriesId = seriesId;
    _seriesName = seriesName;
    _state = state;
    _storyPicLinks = storyPicLinks;
    _subCommoditys = subCommoditys;
    _transactionHash = transactionHash;
    _uniqueId = uniqueId;
    _holderId = holderId;
    _incubationLimit = incubationLimit;
    _introduce = introduce;
    _issUserName = issUserName;
    _logo = logo;
    _price = price;
    _resaleLimitDay = resaleLimitDay;
    _resaleLimitPeople = resaleLimitPeople;
    _saleTime = saleTime;
    _showIssuer = showIssuer;
    _buyPrice = buyPrice;
    _collectionId = collectionId;
    _dailyIncrease = dailyIncrease;
    _enableResale = enableResale;
    _latestTransactionPrice = latestTransactionPrice;
    _preventCollectionPrice = preventCollectionPrice;
    _saleRule = saleRule;
  }

  SecondaryCollectionDetailBean.fromJson(dynamic json) {
    _availableNum = json['availableNum'];
    _collectionCover = json['collectionCover'];
    _collectionDailyIncrease = json['collectionDailyIncrease'];
    _collectionHash = json['collectionHash'];
    _collectionIncubationLimit = json['collectionIncubationLimit'];
    _collectionName = json['collectionName'];
    _collectionSaleRule = json['collectionSaleRule'];
    _collectionSerialNumber = json['collectionSerialNumber'];
    _collectionStartPrice = json['collectionStartPrice'];
    _collectionStartTime = json['collectionStartTime'];
    _commodityType = json['commodityType'];
    _creatorId = json['creatorId'];
    _creatorName = json['creatorName'];
    _guidingPrice = json['guidingPrice'];
    _holderAvatar = json['holderAvatar'];
    _holderBlockChainAddr = json['holderBlockChainAddr'];
    _holderNickName = json['holderNickName'];
    _id = json['id'];
    _incubationPeriod = json['incubationPeriod'];
    _issuedCollectionId = json['issuedCollectionId'];
    _issuerId = json['issuerId'];
    _issuerIntroduce = json['issuerIntroduce'];
    _issuerLogo = json['issuerLogo'];
    _issuerName = json['issuerName'];
    _payWay = json['payWay'];
    _quantity = json['quantity'];
    _resaleDate = json['resaleDate'];
    _resaleMemberId = json['resaleMemberId'];
    _resalePrice = json['resalePrice'];
    _sellerName = json['sellerName'];
    _seriesId = json['seriesId'];
    _seriesName = json['seriesName'];
    _state = json['state'];
    _storyPicLinks = json['storyPicLinks'] != null ? json['storyPicLinks'].cast<String>() : [];
    if (json['subCommoditys'] != null) {
      _subCommoditys = [];
      json['subCommoditys'].forEach((v) {
        _subCommoditys?.add(v);
      });
    }
    _transactionHash = json['transactionHash'];
    _uniqueId = json['uniqueId'];
    _holderId = json['holderId'];
    _incubationLimit = json['incubationLimit'];
    _introduce = json['introduce'];
    _issUserName = json['issUserName'];
    _logo = json['logo'];
    _price = json['price'];
    _resaleLimitDay = json['resaleLimitDay'];
    _resaleLimitPeople = json['resaleLimitPeople'];
    _saleTime = json['saleTime'];
    _showIssuer = json['showIssuer'];
    _buyPrice = json['buyPrice'];
    _collectionId = json['collectionId'];
    _dailyIncrease = json['dailyIncrease'];
    _enableResale = json['enableResale'];
    _latestTransactionPrice = json['latestTransactionPrice'];
    _preventCollectionPrice = json['preventCollectionPrice'];
    _saleRule = json['saleRule'];
  }
  num? _availableNum;
  String? _collectionCover;
  num? _collectionDailyIncrease;
  String? _collectionHash;
  num? _collectionIncubationLimit;
  String? _collectionName;
  String? _collectionSaleRule;
  num? _collectionSerialNumber;
  num? _collectionStartPrice;
  String? _collectionStartTime;
  String? _commodityType;
  String? _creatorId;
  String? _creatorName;
  num? _guidingPrice;
  String? _holderAvatar;
  String? _holderBlockChainAddr;
  String? _holderNickName;
  String? _id;
  num? _incubationPeriod;
  String? _issuedCollectionId;
  String? _issuerId;
  String? _issuerIntroduce;
  String? _issuerLogo;
  String? _issuerName;
  num? _payWay;
  num? _quantity;
  String? _resaleDate;
  String? _resaleMemberId;
  num? _resalePrice;
  String? _sellerName;
  String? _seriesId;
  String? _seriesName;
  String? _state;
  List<String>? _storyPicLinks;
  List<dynamic>? _subCommoditys;
  String? _transactionHash;
  String? _uniqueId;
  String? _holderId;
  num? _incubationLimit;
  String? _introduce;
  String? _issUserName;
  String? _logo;
  num? _price;
  num? _resaleLimitDay;
  num? _resaleLimitPeople;
  String? _saleTime;
  num? _showIssuer;
  num? _buyPrice;
  String? _collectionId;
  num? _dailyIncrease;
  num? _enableResale;
  num? _latestTransactionPrice;
  num? _preventCollectionPrice;
  String? _saleRule;

  num? get availableNum => _availableNum;
  String? get collectionCover => _collectionCover;
  num? get collectionDailyIncrease => _collectionDailyIncrease;
  String? get collectionHash => _collectionHash;
  num? get collectionIncubationLimit => _collectionIncubationLimit;
  String? get collectionName => _collectionName;
  String? get collectionSaleRule => _collectionSaleRule;
  num? get collectionSerialNumber => _collectionSerialNumber;
  num? get collectionStartPrice => _collectionStartPrice;
  String? get collectionStartTime => _collectionStartTime;
  String? get commodityType => _commodityType;
  String? get creatorId => _creatorId;
  String? get creatorName => _creatorName;
  num? get guidingPrice => _guidingPrice;
  String? get holderAvatar => _holderAvatar;
  String? get holderBlockChainAddr => _holderBlockChainAddr;
  String? get holderNickName => _holderNickName;
  String? get id => _id;
  num? get incubationPeriod => _incubationPeriod;
  String? get issuedCollectionId => _issuedCollectionId;
  String? get issuerId => _issuerId;
  String? get issuerIntroduce => _issuerIntroduce;
  String? get issuerLogo => _issuerLogo;
  String? get issuerName => _issuerName;
  num? get payWay => _payWay;
  num? get quantity => _quantity;
  String? get resaleDate => _resaleDate;
  String? get resaleMemberId => _resaleMemberId;
  num? get resalePrice => _resalePrice;
  String? get sellerName => _sellerName;
  String? get seriesId => _seriesId;
  String? get seriesName => _seriesName;
  String? get state => _state;
  List<String>? get storyPicLinks => _storyPicLinks;
  List<dynamic>? get subCommoditys => _subCommoditys;
  String? get transactionHash => _transactionHash;
  String? get uniqueId => _uniqueId;
  String? get holderId => _holderId;
  num? get incubationLimit => _incubationLimit;
  String? get introduce => _introduce;
  String? get issUserName => _issUserName;
  String? get logo => _logo;
  num? get price => _price;
  num? get resaleLimitDay => _resaleLimitDay;
  num? get resaleLimitPeople => _resaleLimitPeople;
  String? get saleTime => _saleTime;
  num? get showIssuer => _showIssuer;
  num? get buyPrice => _buyPrice;
  String? get collectionId => _collectionId;
  num? get dailyIncrease => _dailyIncrease;
  num? get enableResale => _enableResale;
  num? get latestTransactionPrice => _latestTransactionPrice;
  num? get preventCollectionPrice => _preventCollectionPrice;
  String? get saleRule => _saleRule;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['availableNum'] = _availableNum;
    map['collectionCover'] = _collectionCover;
    map['collectionDailyIncrease'] = _collectionDailyIncrease;
    map['collectionHash'] = _collectionHash;
    map['collectionIncubationLimit'] = _collectionIncubationLimit;
    map['collectionName'] = _collectionName;
    map['collectionSaleRule'] = _collectionSaleRule;
    map['collectionSerialNumber'] = _collectionSerialNumber;
    map['collectionStartPrice'] = _collectionStartPrice;
    map['collectionStartTime'] = _collectionStartTime;
    map['commodityType'] = _commodityType;
    map['creatorId'] = _creatorId;
    map['creatorName'] = _creatorName;
    map['guidingPrice'] = _guidingPrice;
    map['holderAvatar'] = _holderAvatar;
    map['holderBlockChainAddr'] = _holderBlockChainAddr;
    map['holderNickName'] = _holderNickName;
    map['id'] = _id;
    map['incubationPeriod'] = _incubationPeriod;
    map['issuedCollectionId'] = _issuedCollectionId;
    map['issuerId'] = _issuerId;
    map['issuerIntroduce'] = _issuerIntroduce;
    map['issuerLogo'] = _issuerLogo;
    map['issuerName'] = _issuerName;
    map['payWay'] = _payWay;
    map['quantity'] = _quantity;
    map['resaleDate'] = _resaleDate;
    map['resaleMemberId'] = _resaleMemberId;
    map['resalePrice'] = _resalePrice;
    map['sellerName'] = _sellerName;
    map['seriesId'] = _seriesId;
    map['seriesName'] = _seriesName;
    map['state'] = _state;
    map['storyPicLinks'] = _storyPicLinks;
    if (_subCommoditys != null) {
      map['subCommoditys'] = _subCommoditys?.map((v) => v.toJson()).toList();
    }
    map['transactionHash'] = _transactionHash;
    map['uniqueId'] = _uniqueId;
    map['holderId'] = _holderId;
    map['incubationLimit'] = _incubationLimit;
    map['introduce'] = _introduce;
    map['issUserName'] = _issUserName;
    map['logo'] = _logo;
    map['price'] = _price;
    map['resaleLimitDay'] = _resaleLimitDay;
    map['resaleLimitPeople'] = _resaleLimitPeople;
    map['saleTime'] = _saleTime;
    map['showIssuer'] = _showIssuer;
    map['buyPrice'] = _buyPrice;
    map['collectionId'] = _collectionId;
    map['dailyIncrease'] = _dailyIncrease;
    map['enableResale'] = _enableResale;
    map['latestTransactionPrice'] = _latestTransactionPrice;
    map['preventCollectionPrice'] = _preventCollectionPrice;
    map['saleRule'] = _saleRule;
    return map;
  }

}