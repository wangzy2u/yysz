class EntranceBean {
  EntranceBean({
      String? createTime, 
      String? entranceName, 
      String? entrancePic, 
      String? entranceType, 
      String? entranceUrl, 
      String? id, 
      String? lastModifyTime,}){
    _createTime = createTime;
    _entranceName = entranceName;
    _entrancePic = entrancePic;
    _entranceType = entranceType;
    _entranceUrl = entranceUrl;
    _id = id;
    _lastModifyTime = lastModifyTime;
}

  EntranceBean.fromJson(dynamic json) {
    _createTime = json['createTime'];
    _entranceName = json['entranceName'];
    _entrancePic = json['entrancePic'];
    _entranceType = json['entranceType'];
    _entranceUrl = json['entranceUrl'];
    _id = json['id'];
    _lastModifyTime = json['lastModifyTime'];
  }
  String? _createTime;
  String? _entranceName;
  String? _entrancePic;
  String? _entranceType;
  String? _entranceUrl;
  String? _id;
  String? _lastModifyTime;

  String? get createTime => _createTime;
  String? get entranceName => _entranceName;
  String? get entrancePic => _entrancePic;
  String? get entranceType => _entranceType;
  String? get entranceUrl => _entranceUrl;
  String? get id => _id;
  String? get lastModifyTime => _lastModifyTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['createTime'] = _createTime;
    map['entranceName'] = _entranceName;
    map['entrancePic'] = _entrancePic;
    map['entranceType'] = _entranceType;
    map['entranceUrl'] = _entranceUrl;
    map['id'] = _id;
    map['lastModifyTime'] = _lastModifyTime;
    return map;
  }

}