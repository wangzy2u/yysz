class MemberCardListBean {
  MemberCardListBean({
      num? activeStatus, 
      num? collectionNum, 
      dynamic cardMemberId, 
      num? existCollectState, 
      String? collectionId, 
      List<MyMemberCardVoBean>? myMemberCardVOList,}){
    _activeStatus = activeStatus;
    _collectionNum = collectionNum;
    _cardMemberId = cardMemberId;
    _existCollectState = existCollectState;
    _collectionId = collectionId;
    _myMemberCardVOList = myMemberCardVOList;
}

  MemberCardListBean.fromJson(dynamic json) {
    _activeStatus = json['activeStatus'];
    _collectionNum = json['collectionNum'];
    _cardMemberId = json['cardMemberId'];
    _existCollectState = json['existCollectState'];
    _collectionId = json['collectionId'];
    if (json['myMemberCardVOList'] != null) {
      _myMemberCardVOList = [];
      json['myMemberCardVOList'].forEach((v) {
        _myMemberCardVOList?.add(MyMemberCardVoBean.fromJson(v));
      });
    }
  }
  num? _activeStatus;
  num? _collectionNum;
  dynamic _cardMemberId;
  num? _existCollectState;
  String? _collectionId;
  List<MyMemberCardVoBean>? _myMemberCardVOList;

  num? get activeStatus => _activeStatus;
  num? get collectionNum => _collectionNum;
  dynamic get cardMemberId => _cardMemberId;
  num? get existCollectState => _existCollectState;
  String? get collectionId => _collectionId;
  List<MyMemberCardVoBean>? get myMemberCardVOList => _myMemberCardVOList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['activeStatus'] = _activeStatus;
    map['collectionNum'] = _collectionNum;
    map['cardMemberId'] = _cardMemberId;
    map['existCollectState'] = _existCollectState;
    map['collectionId'] = _collectionId;
    if (_myMemberCardVOList != null) {
      map['myMemberCardVOList'] = _myMemberCardVOList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}



class MyMemberCardVoBean {
  MyMemberCardVoBean({
    String? icon,
    String? name,
    String? describe,
    String? detail,}){
    _icon = icon;
    _name = name;
    _describe = describe;
    _detail = detail;
  }

  MyMemberCardVoBean.fromJson(dynamic json) {
    _icon = json['icon'];
    _name = json['name'];
    _describe = json['describe'];
    _detail = json['detail'];
  }
  String? _icon;
  String? _name;
  String? _describe;
  String? _detail;

  String? get icon => _icon;
  String? get name => _name;
  String? get describe => _describe;
  String? get detail => _detail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['icon'] = _icon;
    map['name'] = _name;
    map['describe'] = _describe;
    map['detail'] = _detail;
    return map;
  }

}