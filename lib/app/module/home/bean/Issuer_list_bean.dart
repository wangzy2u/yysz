
class IssuerListBean {
  IssuerListBean({
      int? pageNum, 
      int? pageSize, 
      int? totalPage, 
      int? total, 
      int? size, 
      List<IssuerItemBean>? content,}){
    _pageNum = pageNum;
    _pageSize = pageSize;
    _totalPage = totalPage;
    _total = total;
    _size = size;
    _content = content;
}

  IssuerListBean.fromJson(dynamic json) {
    _pageNum = json['pageNum'];
    _pageSize = json['pageSize'];
    _totalPage = json['totalPage'];
    _total = json['total'];
    _size = json['size'];
    if (json['content'] != null) {
      _content = [];
      json['content'].forEach((v) {
        _content?.add(IssuerItemBean.fromJson(v));
      });
    }
  }
  int? _pageNum;
  int? _pageSize;
  int? _totalPage;
  int? _total;
  int? _size;
  List<IssuerItemBean>? _content;

  int? get pageNum => _pageNum;
  int? get pageSize => _pageSize;
  int? get totalPage => _totalPage;
  int? get total => _total;
  int? get size => _size;
  List<IssuerItemBean>? get content => _content;

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


class IssuerItemBean {
  IssuerItemBean({
    String? id,
    String? name,
    String? introduce,
    String? avatar,
    String? logo,
    String? cover,
    String? createTime,
    String? lastModifyTime,}){
    _id = id;
    _name = name;
    _introduce = introduce;
    _avatar = avatar;
    _logo = logo;
    _cover = cover;
    _createTime = createTime;
    _lastModifyTime = lastModifyTime;
  }

  IssuerItemBean.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _introduce = json['introduce'];
    _avatar = json['avatar'];
    _logo = json['logo'];
    _cover = json['cover'];
    _createTime = json['createTime'];
    _lastModifyTime = json['lastModifyTime'];
  }



  String? _id;
  String? _name;
  String? _introduce;
  String? _avatar;
  String? _logo;
  String? _cover;
  String? _createTime;
  String? _lastModifyTime;

  String? get id => _id;
  String? get name => _name;
  String? get introduce => _introduce;
  String? get avatar => _avatar;
  String? get logo => _logo;
  String? get cover => _cover;
  String? get createTime => _createTime;
  String? get lastModifyTime => _lastModifyTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['introduce'] = _introduce;
    map['avatar'] = _avatar;
    map['logo'] = _logo;
    map['cover'] = _cover;
    map['createTime'] = _createTime;
    map['lastModifyTime'] = _lastModifyTime;
    return map;
  }

}