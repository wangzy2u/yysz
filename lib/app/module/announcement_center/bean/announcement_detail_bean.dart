class AnnouncementDetailBean {
  AnnouncementDetailBean({
      String? id, 
      String? title, 
      String? content, 
      String? type, 
      String? typeName, 
      String? publishTime, 
      String? lastModifyTime,}){
    _id = id;
    _title = title;
    _content = content;
    _type = type;
    _typeName = typeName;
    _publishTime = publishTime;
    _lastModifyTime = lastModifyTime;
}

  AnnouncementDetailBean.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _content = json['content'];
    _type = json['type'];
    _typeName = json['typeName'];
    _publishTime = json['publishTime'];
    _lastModifyTime = json['lastModifyTime'];
  }
  String? _id;
  String? _title;
  String? _content;
  String? _type;
  String? _typeName;
  String? _publishTime;
  String? _lastModifyTime;

  String? get id => _id;
  String? get title => _title;
  String? get content => _content;
  String? get type => _type;
  String? get typeName => _typeName;
  String? get publishTime => _publishTime;
  String? get lastModifyTime => _lastModifyTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['content'] = _content;
    map['type'] = _type;
    map['typeName'] = _typeName;
    map['publishTime'] = _publishTime;
    map['lastModifyTime'] = _lastModifyTime;
    return map;
  }

}