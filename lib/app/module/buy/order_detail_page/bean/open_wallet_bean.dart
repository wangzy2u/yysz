class OpenWalletBean {
  OpenWalletBean({
      String? token, 
      String? url,}){
    _token = token;
    _url = url;
}

  OpenWalletBean.fromJson(dynamic json) {
    _token = json['token'];
    _url = json['url'];
  }
  String? _token;
  String? _url;

  String? get token => _token;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    map['url'] = _url;
    return map;
  }

}