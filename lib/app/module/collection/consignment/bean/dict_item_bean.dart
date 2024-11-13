class DictItemBean {
  DictItemBean({
      String? dictItemCode, 
      String? dictItemName, 
      String? dictItemRemark,}){
    _dictItemCode = dictItemCode;
    _dictItemName = dictItemName;
    _dictItemRemark = dictItemRemark;
}

  DictItemBean.fromJson(dynamic json) {
    _dictItemCode = json['dictItemCode'];
    _dictItemName = json['dictItemName'];
    _dictItemRemark = json['dictItemRemark'];
  }
  String? _dictItemCode;
  String? _dictItemName;
  String? _dictItemRemark;

  String? get dictItemCode => _dictItemCode;
  String? get dictItemName => _dictItemName;
  String? get dictItemRemark => _dictItemRemark;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dictItemCode'] = _dictItemCode;
    map['dictItemName'] = _dictItemName;
    map['dictItemRemark'] = _dictItemRemark;
    return map;
  }

}