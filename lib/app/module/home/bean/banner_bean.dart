

class BannerBean {
  BannerBean({
      String? id, 
      String? clickDealWay, 
      String? clickDealWayName, 
      String? cover, 
      String? link, 
      double? orderNo, 
      String? createTime, 
      String? lastModifyTime,}){
    _id = id;
    _clickDealWay = clickDealWay;
    _clickDealWayName = clickDealWayName;
    _cover = cover;
    _link = link;
    _orderNo = orderNo;
    _createTime = createTime;
    _lastModifyTime = lastModifyTime;
}

  BannerBean.fromJson(dynamic json) {
    _id = json['id'];
    _clickDealWay = json['clickDealWay'];
    _clickDealWayName = json['clickDealWayName'];
    _cover = json['cover'];
    _link = json['link'];
    _orderNo = json['orderNo'];
    _createTime = json['createTime'];
    _lastModifyTime = json['lastModifyTime'];
  }
  String? _id;
  String? _clickDealWay;
  String? _clickDealWayName;
  String? _cover;
  String? _link;
  double? _orderNo;
  String? _createTime;
  String? _lastModifyTime;



  String? get id => _id;
  String? get clickDealWay => _clickDealWay;
  String? get clickDealWayName => _clickDealWayName;
  String? get cover => _cover;
  String? get link => _link;
  double? get orderNo => _orderNo;
  String? get createTime => _createTime;
  String? get lastModifyTime => _lastModifyTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['clickDealWay'] = _clickDealWay;
    map['clickDealWayName'] = _clickDealWayName;
    map['cover'] = _cover;
    map['link'] = _link;
    map['orderNo'] = _orderNo;
    map['createTime'] = _createTime;
    map['lastModifyTime'] = _lastModifyTime;
    return map;
  }

}