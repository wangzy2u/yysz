class CityBean {
  CityBean({
      String? code, 
      int? id, 
      int? level, 
      String? name, 
      String? parent,}){
    _code = code;
    _id = id;
    _level = level;
    _name = name;
    _parent = parent;
}

  CityBean.fromJson(dynamic json) {
    _code = json['code'];
    _id = json['id'];
    _level = json['level'];
    _name = json['name'];
    _parent = json['parent'];
  }
  String? _code;
  int? _id;
  int? _level;
  String? _name;
  String? _parent;

  String? get code => _code;
  int? get id => _id;
  int? get level => _level;
  String? get name => _name;
  String? get parent => _parent;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['id'] = _id;
    map['level'] = _level;
    map['name'] = _name;
    map['parent'] = _parent;
    return map;
  }

}