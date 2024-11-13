class TagBean {
  TagBean({
      String? dictItemCode, 
      String? dictItemName,}){
    _dictItemCode = dictItemCode;
    _dictItemName = dictItemName;
}

  TagBean.fromJson(dynamic json) {
    _dictItemCode = json['dictItemCode'];
    _dictItemName = json['dictItemName'];
  }
  String? _dictItemCode;
  String? _dictItemName;

  String? get dictItemCode => _dictItemCode;
  String? get dictItemName => _dictItemName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dictItemCode'] = _dictItemCode;
    map['dictItemName'] = _dictItemName;
    return map;
  }

}