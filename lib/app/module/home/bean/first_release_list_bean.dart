

//首发藏品列表
class FirstReleaseListBean {
  FirstReleaseListBean({
      int? pageNum, 
      int? pageSize, 
      int? totalPage, 
      int? total, 
      int? size, 
      List<FirstReleaseItemBean>? content,}){
    _pageNum = pageNum;
    _pageSize = pageSize;
    _totalPage = totalPage;
    _total = total;
    _size = size;
    _content = content;
}

  FirstReleaseListBean.fromJson(dynamic json) {
    _pageNum = json['pageNum'];
    _pageSize = json['pageSize'];
    _totalPage = json['totalPage'];
    _total = json['total'];
    _size = json['size'];
    if (json['content'] != null) {
      _content = [];
      json['content'].forEach((v) {
        _content?.add(FirstReleaseItemBean.fromJson(v));
      });
    }
  }
  int? _pageNum;
  int? _pageSize;
  int? _totalPage;
  int? _total;
  int? _size;
  List<FirstReleaseItemBean>? _content;

  int? get pageNum => _pageNum;
  int? get pageSize => _pageSize;
  int? get totalPage => _totalPage;
  int? get total => _total;
  int? get size => _size;
  List<FirstReleaseItemBean>? get content => _content;

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


class FirstReleaseItemBean {
  FirstReleaseItemBean({
    num? availableNum,
    String? background,
    String? buyRule,
    String? collectionHash,
    List<CollectionStorys>? collectionStorys,
    String? commodityType,
    String? commodityTypeName,
    String? cover,
    num? coverDisplayType,
    String? coverDisplayTypeName,
    String? createTime,
    String? creatorId,
    String? creatorName,
    num? creatorShareRatio,
    bool? externalSaleFlag,
    String? id,
    num? isIssuer,
    String? issuerId,
    String? issuerIntroduce,
    String? issuerLogo,
    String? issuerName,
    num? issuerProfitRatio,
    String? name,
    num? onShelf,
    bool? preSaleFlag,
    num? price,
    num? quantity,
    num? reserve,
    num? saleState,
    String? saleTime,
    String? seriesId,
    String? seriesName,
    num? showCollectionStory,
    num? showCreator,
    num? showIssuer,
    num? singleOrderLimit,
    num? singlePersonLimit,
    num? stock,
    num? workType,
    String? workTypeName,}){
    _availableNum = availableNum;
    _background = background;
    _buyRule = buyRule;
    _collectionHash = collectionHash;
    _collectionStorys = collectionStorys;
    _commodityType = commodityType;
    _commodityTypeName = commodityTypeName;
    _cover = cover;
    _coverDisplayType = coverDisplayType;
    _coverDisplayTypeName = coverDisplayTypeName;
    _createTime = createTime;
    _creatorId = creatorId;
    _creatorName = creatorName;
    _creatorShareRatio = creatorShareRatio;
    _externalSaleFlag = externalSaleFlag;
    _id = id;
    _isIssuer = isIssuer;
    _issuerId = issuerId;
    _issuerIntroduce = issuerIntroduce;
    _issuerLogo = issuerLogo;
    _issuerName = issuerName;
    _issuerProfitRatio = issuerProfitRatio;
    _name = name;
    _onShelf = onShelf;
    _preSaleFlag = preSaleFlag;
    _price = price;
    _quantity = quantity;
    _reserve = reserve;
    _saleState = saleState;
    _saleTime = saleTime;
    _seriesId = seriesId;
    _seriesName = seriesName;
    _showCollectionStory = showCollectionStory;
    _showCreator = showCreator;
    _showIssuer = showIssuer;
    _singleOrderLimit = singleOrderLimit;
    _singlePersonLimit = singlePersonLimit;
    _stock = stock;
    _workType = workType;
    _workTypeName = workTypeName;
  }

  FirstReleaseItemBean.fromJson(dynamic json) {
    _availableNum = json['availableNum'];
    _background = json['background'];
    _buyRule = json['buyRule'];
    _collectionHash = json['collectionHash'];
    if (json['collectionStorys'] != null) {
      _collectionStorys = [];
      json['collectionStorys'].forEach((v) {
        _collectionStorys?.add(CollectionStorys.fromJson(v));
      });
    }
    _commodityType = json['commodityType'];
    _commodityTypeName = json['commodityTypeName'];
    _cover = json['cover'];
    _coverDisplayType = json['coverDisplayType'];
    _coverDisplayTypeName = json['coverDisplayTypeName'];
    _createTime = json['createTime'];
    _creatorId = json['creatorId'];
    _creatorName = json['creatorName'];
    _creatorShareRatio = json['creatorShareRatio'];
    _externalSaleFlag = json['externalSaleFlag'];
    _id = json['id'];
    _isIssuer = json['isIssuer'];
    _issuerId = json['issuerId'];
    _issuerIntroduce = json['issuerIntroduce'];
    _issuerLogo = json['issuerLogo'];
    _issuerName = json['issuerName'];
    _issuerProfitRatio = json['issuerProfitRatio'];
    _name = json['name'];
    _onShelf = json['onShelf'];
    _preSaleFlag = json['preSaleFlag'];
    _price = json['price'];
    _quantity = json['quantity'];
    _reserve = json['reserve'];
    _saleState = json['saleState'];
    _saleTime = json['saleTime'];
    _seriesId = json['seriesId'];
    _seriesName = json['seriesName'];
    _showCollectionStory = json['showCollectionStory'];
    _showCreator = json['showCreator'];
    _showIssuer = json['showIssuer'];
    _singleOrderLimit = json['singleOrderLimit'];
    _singlePersonLimit = json['singlePersonLimit'];
    _stock = json['stock'];
    _workType = json['workType'];
    _workTypeName = json['workTypeName'];
  }
  num? _availableNum;
  String? _background;
  String? _buyRule;
  String? _collectionHash;
  List<CollectionStorys>? _collectionStorys;
  String? _commodityType;
  String? _commodityTypeName;
  String? _cover;
  num? _coverDisplayType;
  String? _coverDisplayTypeName;
  String? _createTime;
  String? _creatorId;
  String? _creatorName;
  num? _creatorShareRatio;
  bool? _externalSaleFlag;
  String? _id;
  num? _isIssuer;
  String? _issuerId;
  String? _issuerIntroduce;
  String? _issuerLogo;
  String? _issuerName;
  num? _issuerProfitRatio;
  String? _name;
  num? _onShelf;
  bool? _preSaleFlag;
  num? _price;
  num? _quantity;
  num? _reserve;
  num? _saleState;
  String? _saleTime;
  String? _seriesId;
  String? _seriesName;
  num? _showCollectionStory;
  num? _showCreator;
  num? _showIssuer;
  num? _singleOrderLimit;
  num? _singlePersonLimit;
  num? _stock;
  num? _workType;
  String? _workTypeName;

  num? get availableNum => _availableNum;
  String? get background => _background;
  String? get buyRule => _buyRule;
  String? get collectionHash => _collectionHash;
  List<CollectionStorys>? get collectionStorys => _collectionStorys;
  String? get commodityType => _commodityType;
  String? get commodityTypeName => _commodityTypeName;
  String? get cover => _cover;
  num? get coverDisplayType => _coverDisplayType;
  String? get coverDisplayTypeName => _coverDisplayTypeName;
  String? get createTime => _createTime;
  String? get creatorId => _creatorId;
  String? get creatorName => _creatorName;
  num? get creatorShareRatio => _creatorShareRatio;
  bool? get externalSaleFlag => _externalSaleFlag;
  String? get id => _id;
  num? get isIssuer => _isIssuer;
  String? get issuerId => _issuerId;
  String? get issuerIntroduce => _issuerIntroduce;
  String? get issuerLogo => _issuerLogo;
  String? get issuerName => _issuerName;
  num? get issuerProfitRatio => _issuerProfitRatio;
  String? get name => _name;
  num? get onShelf => _onShelf;
  bool? get preSaleFlag => _preSaleFlag;
  num? get price => _price;
  num? get quantity => _quantity;
  num? get reserve => _reserve;
  num? get saleState => _saleState;
  String? get saleTime => _saleTime;
  String? get seriesId => _seriesId;
  String? get seriesName => _seriesName;
  num? get showCollectionStory => _showCollectionStory;
  num? get showCreator => _showCreator;
  num? get showIssuer => _showIssuer;
  num? get singleOrderLimit => _singleOrderLimit;
  num? get singlePersonLimit => _singlePersonLimit;
  num? get stock => _stock;
  num? get workType => _workType;
  String? get workTypeName => _workTypeName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['availableNum'] = _availableNum;
    map['background'] = _background;
    map['buyRule'] = _buyRule;
    map['collectionHash'] = _collectionHash;
    if (_collectionStorys != null) {
      map['collectionStorys'] = _collectionStorys?.map((v) => v.toJson()).toList();
    }
    map['commodityType'] = _commodityType;
    map['commodityTypeName'] = _commodityTypeName;
    map['cover'] = _cover;
    map['coverDisplayType'] = _coverDisplayType;
    map['coverDisplayTypeName'] = _coverDisplayTypeName;
    map['createTime'] = _createTime;
    map['creatorId'] = _creatorId;
    map['creatorName'] = _creatorName;
    map['creatorShareRatio'] = _creatorShareRatio;
    map['externalSaleFlag'] = _externalSaleFlag;
    map['id'] = _id;
    map['isIssuer'] = _isIssuer;
    map['issuerId'] = _issuerId;
    map['issuerIntroduce'] = _issuerIntroduce;
    map['issuerLogo'] = _issuerLogo;
    map['issuerName'] = _issuerName;
    map['issuerProfitRatio'] = _issuerProfitRatio;
    map['name'] = _name;
    map['onShelf'] = _onShelf;
    map['preSaleFlag'] = _preSaleFlag;
    map['price'] = _price;
    map['quantity'] = _quantity;
    map['reserve'] = _reserve;
    map['saleState'] = _saleState;
    map['saleTime'] = _saleTime;
    map['seriesId'] = _seriesId;
    map['seriesName'] = _seriesName;
    map['showCollectionStory'] = _showCollectionStory;
    map['showCreator'] = _showCreator;
    map['showIssuer'] = _showIssuer;
    map['singleOrderLimit'] = _singleOrderLimit;
    map['singlePersonLimit'] = _singlePersonLimit;
    map['stock'] = _stock;
    map['workType'] = _workType;
    map['workTypeName'] = _workTypeName;
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