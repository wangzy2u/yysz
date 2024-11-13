import 'dart:core';

class StonePlatformListBean {
  StonePlatformListBean({
      String? date, 
      double? num,}){
    _date = date;
    _num = num;
}

  StonePlatformListBean.fromJson(dynamic json) {
    _date = json['date'];
    _num = json['num'];
  }
  String? _date;
  double? _num;

  String? get date => _date;
  double? get num => _num;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = _date;
    map['num'] = _num;
    return map;
  }

}