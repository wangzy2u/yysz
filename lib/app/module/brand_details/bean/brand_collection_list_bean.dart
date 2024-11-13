

import 'collection_detail_bean.dart';

class BrandCollectionListBean {
  BrandCollectionListBean({
      int? pageNum, 
      int? pageSize, 
      int? totalPage, 
      int? total, 
      int? size, 
      List<CollectionDetailBean>? content,}){
    _pageNum = pageNum;
    _pageSize = pageSize;
    _totalPage = totalPage;
    _total = total;
    _size = size;
    _content = content;
}

  BrandCollectionListBean.fromJson(dynamic json) {
    _pageNum = json['pageNum'];
    _pageSize = json['pageSize'];
    _totalPage = json['totalPage'];
    _total = json['total'];
    _size = json['size'];
    if (json['content'] != null) {
      _content = [];
      json['content'].forEach((v) {
        _content?.add(CollectionDetailBean.fromJson(v));
      });
    }
  }
  int? _pageNum;
  int? _pageSize;
  int? _totalPage;
  int? _total;
  int? _size;
  List<CollectionDetailBean>? _content;

  int? get pageNum => _pageNum;
  int? get pageSize => _pageSize;
  int? get totalPage => _totalPage;
  int get total => _total ?? 0;
  int? get size => _size;
  List<CollectionDetailBean>? get content => _content;

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


