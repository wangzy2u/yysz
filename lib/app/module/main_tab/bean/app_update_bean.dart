class AppUpdateBean {
  AppUpdateBean({
      String? appUrl, 
      num? channel, 
      String? createTime, 
      String? effectiveTime, 
      String? id, 
      String? interversion, 
      String? updatePlanActive, 
      String? updateRemark, 
      String? updateType, 
      String? version,}){
    _appUrl = appUrl;
    _channel = channel;
    _createTime = createTime;
    _effectiveTime = effectiveTime;
    _id = id;
    _interversion = interversion;
    _updatePlanActive = updatePlanActive;
    _updateRemark = updateRemark;
    _updateType = updateType;
    _version = version;
}

  AppUpdateBean.fromJson(dynamic json) {
    _appUrl = json['appUrl'];
    _channel = json['channel'];
    _createTime = json['createTime'];
    _effectiveTime = json['effectiveTime'];
    _id = json['id'];
    _interversion = json['interversion'];
    _updatePlanActive = json['updatePlanActive'];
    _updateRemark = json['updateRemark'];
    _updateType = json['updateType'];
    _version = json['version'];
  }
  String? _appUrl;
  num? _channel;
  String? _createTime;
  String? _effectiveTime;
  String? _id;
  String? _interversion;
  String? _updatePlanActive;
  String? _updateRemark;
  String? _updateType;
  String? _version;

  String? get appUrl => _appUrl;
  num? get channel => _channel;
  String? get createTime => _createTime;
  String? get effectiveTime => _effectiveTime;
  String? get id => _id;
  String? get interversion => _interversion;
  String? get updatePlanActive => _updatePlanActive;
  String? get updateRemark => _updateRemark;
  String? get updateType => _updateType;
  String? get version => _version;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['appUrl'] = _appUrl;
    map['channel'] = _channel;
    map['createTime'] = _createTime;
    map['effectiveTime'] = _effectiveTime;
    map['id'] = _id;
    map['interversion'] = _interversion;
    map['updatePlanActive'] = _updatePlanActive;
    map['updateRemark'] = _updateRemark;
    map['updateType'] = _updateType;
    map['version'] = _version;
    return map;
  }

}