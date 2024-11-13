class TutorialItemBean {
  TutorialItemBean({
      String? id, 
      String? title, 
      String? videoUrl, 
      num? views, 
      num? type, 
      num? sortOrder,}){
    _id = id;
    _title = title;
    _videoUrl = videoUrl;
    _views = views;
    _type = type;
    _sortOrder = sortOrder;
}

  TutorialItemBean.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _videoUrl = json['videoUrl'];
    _views = json['views'];
    _type = json['type'];
    _sortOrder = json['sortOrder'];
  }
  String? _id;
  String? _title;
  String? _videoUrl;
  num? _views;
  num? _type;
  num? _sortOrder;

  String? get id => _id;
  String? get title => _title;
  String? get videoUrl => _videoUrl;
  num? get views => _views;
  num? get type => _type;
  num? get sortOrder => _sortOrder;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['videoUrl'] = _videoUrl;
    map['views'] = _views;
    map['type'] = _type;
    map['sortOrder'] = _sortOrder;
    return map;
  }

}