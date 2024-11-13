class MineStoneBean {
  MineStoneBean({
      num? mineNum, 
      num? platformNum,}){
    _mineNum = mineNum;
    _platformNum = platformNum;
}

  MineStoneBean.fromJson(dynamic json) {
    _mineNum = json['mineNum'];
    _platformNum = json['platformNum'];
  }
  num? _mineNum;
  num? _platformNum;

  num? get mineNum => _mineNum;
  num? get platformNum => _platformNum;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mineNum'] = _mineNum;
    map['platformNum'] = _platformNum;
    return map;
  }

}