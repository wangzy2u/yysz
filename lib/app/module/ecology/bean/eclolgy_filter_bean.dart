
class EclolgyFilterItemBean {
  EclolgyFilterItemBean({
    String? id,
    String? name,
    String? introduce,
    String? logo,
    String? cover,
    String? createTime,
    String? lastModifyTime,}){
    _id = id;
    _name = name;
    _introduce = introduce;
    _logo = logo;
    _cover = cover;
    _createTime = createTime;
    _lastModifyTime = lastModifyTime;
  }

  EclolgyFilterItemBean.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _introduce = json['introduce'];
    _logo = json['logo'];
    _cover = json['cover'];
    _createTime = json['createTime'];
    _lastModifyTime = json['lastModifyTime'];
  }
  String? _id;
  String? _name;
  String? _introduce;
  String? _logo;
  String? _cover;
  String? _createTime;
  String? _lastModifyTime;

  String? get id => _id;
  String? get name => _name;
  String? get introduce => _introduce;
  String? get logo => _logo;
  String? get cover => _cover;
  String? get createTime => _createTime;
  String? get lastModifyTime => _lastModifyTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['introduce'] = _introduce;
    map['logo'] = _logo;
    map['cover'] = _cover;
    map['createTime'] = _createTime;
    map['lastModifyTime'] = _lastModifyTime;
    return map;
  }

}

class EclolgyFilterBean {
  EclolgyFilterBean({
      num? pageNum, 
      num? pageSize, 
      num? totalPage, 
      num? total, 
      num? size, 
      List<EclolgyFilterItemBean>? content,}){
    _pageNum = pageNum;
    _pageSize = pageSize;
    _totalPage = totalPage;
    _total = total;
    _size = size;
    _content = content;
}

  EclolgyFilterBean.fromJson(dynamic json) {
    _pageNum = json['pageNum'];
    _pageSize = json['pageSize'];
    _totalPage = json['totalPage'];
    _total = json['total'];
    _size = json['size'];
    if (json['content'] != null) {
      _content = [];
      json['content'].forEach((v) {
        _content?.add(EclolgyFilterItemBean.fromJson(v));
      });
    }
  }
  num? _pageNum;
  num? _pageSize;
  num? _totalPage;
  num? _total;
  num? _size;
  List<EclolgyFilterItemBean>? _content;

  num? get pageNum => _pageNum;
  num? get pageSize => _pageSize;
  num? get totalPage => _totalPage;
  num? get total => _total;
  num? get size => _size;
  List<EclolgyFilterItemBean>? get content => _content;

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