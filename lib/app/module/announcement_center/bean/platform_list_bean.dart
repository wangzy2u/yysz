
class PlatformListBean {
  PlatformListBean({
      num? pageNum, 
      num? pageSize, 
      num? totalPage, 
      num? total, 
      num? size, 
      List<PlatformContent>? content,}){
    _pageNum = pageNum;
    _pageSize = pageSize;
    _totalPage = totalPage;
    _total = total;
    _size = size;
    _content = content;
}

  PlatformListBean.fromJson(dynamic json) {
    _pageNum = json['pageNum'];
    _pageSize = json['pageSize'];
    _totalPage = json['totalPage'];
    _total = json['total'];
    _size = json['size'];
    if (json['content'] != null) {
      _content = [];
      json['content'].forEach((v) {
        _content?.add(PlatformContent.fromJson(v));
      });
    }
  }
  num? _pageNum;
  num? _pageSize;
  num? _totalPage;
  num? _total;
  num? _size;
  List<PlatformContent>? _content;

  num? get pageNum => _pageNum;
  num? get pageSize => _pageSize;
  num? get totalPage => _totalPage;
  num? get total => _total;
  num? get size => _size;
  List<PlatformContent>? get content => _content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pageNum'] = _pageNum;
    map['pageSize'] = _pageSize;
    map['totalPage'] = _totalPage;
    map['total'] = _total;
    map['size'] = _size;
    if (_content != null) {
      map['content'] = _content?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}



class PlatformContent {
  PlatformContent({
    String? id,
    String? title,
    String? publishTime,}){
    _id = id;
    _title = title;
    _publishTime = publishTime;
  }

  PlatformContent.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _publishTime = json['publishTime'];
  }
  String? _id;
  String? _title;
  String? _publishTime;

  String? get id => _id;
  String? get title => _title;
  String? get publishTime => _publishTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['publishTime'] = _publishTime;
    return map;
  }
}