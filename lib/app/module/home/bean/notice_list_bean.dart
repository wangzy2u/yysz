
class NoticeListBean {
  NoticeListBean({
      int? pageNum, 
      int? pageSize, 
      int? totalPage, 
      int? total, 
      int? size, 
      List<NoticeItemBean>? content,}){
    _pageNum = pageNum;
    _pageSize = pageSize;
    _totalPage = totalPage;
    _total = total;
    _size = size;
    _content = content;
}

  NoticeListBean.fromJson(dynamic json) {
    _pageNum = json['pageNum'];
    _pageSize = json['pageSize'];
    _totalPage = json['totalPage'];
    _total = json['total'];
    _size = json['size'];
    if (json['content'] != null) {
      _content = [];
      json['content'].forEach((v) {
        _content?.add(NoticeItemBean.fromJson(v));
      });
    }
  }
  int? _pageNum;
  int? _pageSize;
  int? _totalPage;
  int? _total;
  int? _size;
  List<NoticeItemBean>? _content;

  int? get pageNum => _pageNum;
  int? get pageSize => _pageSize;
  int? get totalPage => _totalPage;
  int? get total => _total;
  int? get size => _size;
  List<NoticeItemBean>? get content => _content;

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


class NoticeItemBean {
  NoticeItemBean({
    String? id,
    String? title,
    String? publishTime,}){
    _id = id;
    _title = title;
    _publishTime = publishTime;
  }

  NoticeItemBean.fromJson(dynamic json) {
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