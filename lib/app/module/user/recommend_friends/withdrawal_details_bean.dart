class WithdrawalDetailsBean {
  WithdrawalDetailsBean({
      num? endRow, 
      bool? hasNextPage, 
      bool? hasPreviousPage, 
      bool? isFirstPage, 
      bool? isLastPage, 
      List<WithdrawalDetailsItemBean>? list,
      num? navigateFirstPage, 
      num? navigateLastPage, 
      num? navigatePages, 
      List<num>? navigatepageNums, 
      num? nextPage, 
      num? pageNum, 
      num? pageSize, 
      num? pages, 
      num? prePage, 
      num? size, 
      num? startRow, 
      num? total,}){
    _endRow = endRow;
    _hasNextPage = hasNextPage;
    _hasPreviousPage = hasPreviousPage;
    _isFirstPage = isFirstPage;
    _isLastPage = isLastPage;
    _list = list;
    _navigateFirstPage = navigateFirstPage;
    _navigateLastPage = navigateLastPage;
    _navigatePages = navigatePages;
    _navigatepageNums = navigatepageNums;
    _nextPage = nextPage;
    _pageNum = pageNum;
    _pageSize = pageSize;
    _pages = pages;
    _prePage = prePage;
    _size = size;
    _startRow = startRow;
    _total = total;
}

  WithdrawalDetailsBean.fromJson(dynamic json) {
    _endRow = json['endRow'];
    _hasNextPage = json['hasNextPage'];
    _hasPreviousPage = json['hasPreviousPage'];
    _isFirstPage = json['isFirstPage'];
    _isLastPage = json['isLastPage'];
    if (json['list'] != null) {
      _list = [];
      json['list'].forEach((v) {
        _list?.add(WithdrawalDetailsItemBean.fromJson(v));
      });
    }
    _navigateFirstPage = json['navigateFirstPage'];
    _navigateLastPage = json['navigateLastPage'];
    _navigatePages = json['navigatePages'];
    _navigatepageNums = json['navigatepageNums'] != null ? json['navigatepageNums'].cast<num>() : [];
    _nextPage = json['nextPage'];
    _pageNum = json['pageNum'];
    _pageSize = json['pageSize'];
    _pages = json['pages'];
    _prePage = json['prePage'];
    _size = json['size'];
    _startRow = json['startRow'];
    _total = json['total'];
  }
  num? _endRow;
  bool? _hasNextPage;
  bool? _hasPreviousPage;
  bool? _isFirstPage;
  bool? _isLastPage;
  List<WithdrawalDetailsItemBean>? _list;
  num? _navigateFirstPage;
  num? _navigateLastPage;
  num? _navigatePages;
  List<num>? _navigatepageNums;
  num? _nextPage;
  num? _pageNum;
  num? _pageSize;
  num? _pages;
  num? _prePage;
  num? _size;
  num? _startRow;
  num? _total;

  num? get endRow => _endRow;
  bool? get hasNextPage => _hasNextPage;
  bool? get hasPreviousPage => _hasPreviousPage;
  bool? get isFirstPage => _isFirstPage;
  bool? get isLastPage => _isLastPage;
  List<WithdrawalDetailsItemBean>? get list => _list;
  num? get navigateFirstPage => _navigateFirstPage;
  num? get navigateLastPage => _navigateLastPage;
  num? get navigatePages => _navigatePages;
  List<num>? get navigatepageNums => _navigatepageNums;
  num? get nextPage => _nextPage;
  num? get pageNum => _pageNum;
  num? get pageSize => _pageSize;
  num? get pages => _pages;
  num? get prePage => _prePage;
  num? get size => _size;
  num? get startRow => _startRow;
  num? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['endRow'] = _endRow;
    map['hasNextPage'] = _hasNextPage;
    map['hasPreviousPage'] = _hasPreviousPage;
    map['isFirstPage'] = _isFirstPage;
    map['isLastPage'] = _isLastPage;
    if (_list != null) {
      map['list'] = _list?.map((v) => v.toJson()).toList();
    }
    map['navigateFirstPage'] = _navigateFirstPage;
    map['navigateLastPage'] = _navigateLastPage;
    map['navigatePages'] = _navigatePages;
    map['navigatepageNums'] = _navigatepageNums;
    map['nextPage'] = _nextPage;
    map['pageNum'] = _pageNum;
    map['pageSize'] = _pageSize;
    map['pages'] = _pages;
    map['prePage'] = _prePage;
    map['size'] = _size;
    map['startRow'] = _startRow;
    map['total'] = _total;
    return map;
  }

}

class WithdrawalDetailsItemBean {
  WithdrawalDetailsItemBean({
    String? amount,
    String? callbackRequest,
    String? callbackResponse,
    num? callbackStatus,
    String? customerNo,
    String? feeChargeSide,
    String? fromMerchantNo,
    String? gmtCreate,
    String? gmtModified,
    num? id,
    String? notifyUrl,
    String? orderAmount,
    String? orderNo,
    String? parentMerchantNo,
    String? reason,
    String? remark,
    String? requestId,
    String? requestNo,
    String? status,
    String? toMerchantNo,
    String? toMerchantUserNo,}){
    _amount = amount;
    _callbackRequest = callbackRequest;
    _callbackResponse = callbackResponse;
    _callbackStatus = callbackStatus;
    _customerNo = customerNo;
    _feeChargeSide = feeChargeSide;
    _fromMerchantNo = fromMerchantNo;
    _gmtCreate = gmtCreate;
    _gmtModified = gmtModified;
    _id = id;
    _notifyUrl = notifyUrl;
    _orderAmount = orderAmount;
    _orderNo = orderNo;
    _parentMerchantNo = parentMerchantNo;
    _reason = reason;
    _remark = remark;
    _requestId = requestId;
    _requestNo = requestNo;
    _status = status;
    _toMerchantNo = toMerchantNo;
    _toMerchantUserNo = toMerchantUserNo;
  }

  WithdrawalDetailsItemBean.fromJson(dynamic json) {
    _amount = json['amount'];
    _callbackRequest = json['callbackRequest'];
    _callbackResponse = json['callbackResponse'];
    _callbackStatus = json['callbackStatus'];
    _customerNo = json['customerNo'];
    _feeChargeSide = json['feeChargeSide'];
    _fromMerchantNo = json['fromMerchantNo'];
    _gmtCreate = json['gmtCreate'];
    _gmtModified = json['gmtModified'];
    _id = json['id'];
    _notifyUrl = json['notifyUrl'];
    _orderAmount = json['orderAmount'];
    _orderNo = json['orderNo'];
    _parentMerchantNo = json['parentMerchantNo'];
    _reason = json['reason'];
    _remark = json['remark'];
    _requestId = json['requestId'];
    _requestNo = json['requestNo'];
    _status = json['status'];
    _toMerchantNo = json['toMerchantNo'];
    _toMerchantUserNo = json['toMerchantUserNo'];
  }
  String? _amount;
  String? _callbackRequest;
  String? _callbackResponse;
  num? _callbackStatus;
  String? _customerNo;
  String? _feeChargeSide;
  String? _fromMerchantNo;
  String? _gmtCreate;
  String? _gmtModified;
  num? _id;
  String? _notifyUrl;
  String? _orderAmount;
  String? _orderNo;
  String? _parentMerchantNo;
  String? _reason;
  String? _remark;
  String? _requestId;
  String? _requestNo;
  String? _status;
  String? _toMerchantNo;
  String? _toMerchantUserNo;

  String? get amount => _amount;
  String? get callbackRequest => _callbackRequest;
  String? get callbackResponse => _callbackResponse;
  num? get callbackStatus => _callbackStatus;
  String? get customerNo => _customerNo;
  String? get feeChargeSide => _feeChargeSide;
  String? get fromMerchantNo => _fromMerchantNo;
  String? get gmtCreate => _gmtCreate;
  String? get gmtModified => _gmtModified;
  num? get id => _id;
  String? get notifyUrl => _notifyUrl;
  String? get orderAmount => _orderAmount;
  String? get orderNo => _orderNo;
  String? get parentMerchantNo => _parentMerchantNo;
  String? get reason => _reason;
  String? get remark => _remark;
  String? get requestId => _requestId;
  String? get requestNo => _requestNo;
  String? get status => _status;
  String? get toMerchantNo => _toMerchantNo;
  String? get toMerchantUserNo => _toMerchantUserNo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['amount'] = _amount;
    map['callbackRequest'] = _callbackRequest;
    map['callbackResponse'] = _callbackResponse;
    map['callbackStatus'] = _callbackStatus;
    map['customerNo'] = _customerNo;
    map['feeChargeSide'] = _feeChargeSide;
    map['fromMerchantNo'] = _fromMerchantNo;
    map['gmtCreate'] = _gmtCreate;
    map['gmtModified'] = _gmtModified;
    map['id'] = _id;
    map['notifyUrl'] = _notifyUrl;
    map['orderAmount'] = _orderAmount;
    map['orderNo'] = _orderNo;
    map['parentMerchantNo'] = _parentMerchantNo;
    map['reason'] = _reason;
    map['remark'] = _remark;
    map['requestId'] = _requestId;
    map['requestNo'] = _requestNo;
    map['status'] = _status;
    map['toMerchantNo'] = _toMerchantNo;
    map['toMerchantUserNo'] = _toMerchantUserNo;
    return map;
  }

}