import 'package:nft_flutter/app/network/network_manager.dart';

import '../../../common/http/http/dio_new.dart';
import '../../data/base_api.dart';
import '../../module/user/order_list/bean/Airdrop_order_list_bean.dart';
import '../../module/user/order_list/bean/consignment_list_bean.dart';
import '../../module/user/order_list/bean/order_list_bean.dart';

extension OrderApi on NetworkManager {
  // http://175.27.138.121:8088/api/transaction/latestCollectionCreateOrder
  ///订单--》获取订单详情
  Future<HttpResponse> getMyParOrderDetail(
    String id,
  ) {
    var data = {
      'id': id,
    };
    return NetworkManager()
        .get('/transaction/findMyPayOrderDetail', queryParameters: data);
  }

  /// 首发 大厅订单列表
  Future<List<OrderListItemBean>> findMyPayOrderByPage(
      {int pageNum = 1,
      int pageSize = 6,
      required String state,
      required String productType}) async {
    var res = await NetworkManager().get('/transaction/findMyPayOrderByPage',
        queryParameters: {
          'pageNum': '1',
          'pageSize': '100',
          'state': state,
          'productType': productType
        });
    List<OrderListItemBean> list = [];
    if (res.success && res.data != null) {
      OrderListBean listBean = OrderListBean.fromJson(res.data);
      if (listBean.content != null) {
        list = listBean.content ?? [];
      }
    }
    return list;
  }

  /// 寄售订单列表
  Future<List<ConsignmentOrderListItemBean>> findMyResaleCollectionByPage(
      {int pageNum = 1, int pageSize = 6, required String state}) async {
    var res = await NetworkManager()
        .get('/myArtwork/findMyResaleCollectionByPage', queryParameters: {
      'pageNum': '1',
      'pageSize': '100',
      'state': state,
      'productType': 'CONSIGNMENT'
    });
    List<ConsignmentOrderListItemBean> list = [];
    if (res.success && res.data != null) {
      ConsignmentOrderListBean listBean =
          ConsignmentOrderListBean.fromJson(res.data);
      if (listBean.content != null) {
        list = listBean.content ?? [];
      }
    }
    return list;
    // http://175.27.138.121:8088/api/myArtwork/findMyResaleCollectionByPage?pageSize=10&pageNum=1&productType=CONSIGNMENT&state=
  }

  /// 空投订单列表
  Future<List<AirdropOrderListItemBean>> findAirDropRecordHoldByPage(
      {int pageNum = 1,
      int pageSize = 6,
      required String state,
      required bool isOnChain}) async {
    Map<String, dynamic> queryParameters = {
      'pageNum': '1',
      'pageSize': '100',
      'state': state,
      'isOnChain': isOnChain,
      'productType': 'AIRDROP'
    };
    // 全部isOnChain传空
    if (state == '') {
      queryParameters = {
        'pageNum': '1',
        'pageSize': '100',
        'state': state,
        'isOnChain': '',
        'productType': 'AIRDROP'
      };
    }
    var res = await NetworkManager()
        .get('/airDrop/findAirDropRecordHoldByPage', queryParameters: queryParameters);
    List<AirdropOrderListItemBean> list = [];
    if (res.success && res.data != null) {
      AirdropOrderListBean listBean = AirdropOrderListBean.fromJson(res.data);
      if (listBean.list != null) {
        list = listBean.list ?? [];
      }
    }
    return list;
  }

  /// 获取支付方式 http://test.yuanyushuzi.cn/payment/queryRegister
  Future<HttpResponse> getPayRegister(String accountId) {
    var data = {
      'accountId': accountId,
    };
    return NetworkManager().post('${BaseApi.kPayUrl}/payment/queryRegister',
        params: data, contentType: NetworkManager.contentTypeJson);
  }

  /// 支付下单接口：http://test.yuanyushuzi.cn/payment/pay
  Future<HttpResponse> payment(Map<String, dynamic> content) {
    // var data = {
    //   'data': content,
    // };
    return NetworkManager().post('${BaseApi.kPayUrl}/payment/pay',
        params: content, contentType: NetworkManager.contentTypeJson);
  }

  /// 取消订单：http://175.27.138.121:8088/api/transaction/cancelPay
  Future<HttpResponse> cancelOrder(String orderId, String memberId) {
    var data = {
      'orderId': orderId,
      'memberId': memberId,
    };
    return NetworkManager().post('/transaction/cancelPay', params: data);
  }

// Future<List<IssuerItemBean>> getHomeIssuer(
//     {int pageNum = 1, int pageSize = 6}) async {
//   var res = await NetworkManager().get('/collection/findIssuerByPage',
//       queryParameters: {'pageNum': pageNum, 'pageSize': pageSize});
//
//   List<IssuerItemBean> list = [];
//   if (res.success && res.data != null) {
//     IssuerListBean noticeBean = IssuerListBean.fromJson(res.data);
//
//     if (noticeBean.content != null) {
//       list = noticeBean.content ?? [];
//     }
//   }
//   return list;
// }
}
