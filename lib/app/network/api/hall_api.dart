import 'package:nft_flutter/app/module/hall/bean/secondary_market_collection_list.dart';
import 'package:nft_flutter/app/network/network_manager.dart';

import '../../module/brand_details/bean/collection_detail_bean.dart';
import '../../module/collection_group_detail/bean/collection_pending_orders_list_bean.dart';

extension HallApi on NetworkManager {
  /// 获取大厅资产列表 http://175.27.138.121:8088/api/collection/findSecondaryMarketCollection?issuerId=&pageSize=20&commodityType=1&pageNum=1
  Future<SecondaryMarketCollectionList?> getSecondaryMarketCollection(
      {String issuerId = '',
      String collectionName = '',
      String commodityType = '1',
      int pageNum = 1,
      int pageSize = 10}) async {
    var res = await NetworkManager()
        .get('/collection/findSecondaryMarketCollection', queryParameters: {
      'issuerId': issuerId,
      'commodityType': commodityType,
      'collectionName': collectionName,
      'pageNum': pageNum,
      'pageSize': pageSize
    });

    SecondaryMarketCollectionList? result;

    // List<BannerBean> list = [];
    if (res.success && res.data != null) {
      result = SecondaryMarketCollectionList.fromJson(res.data);
    }
    return result;
  }

  /// 获取藏品挂单详情信息 /memberResaleCollection/findResaleCollectionByCollectionId?collectionId=1845650770918113280
  Future<CollectionDetailBean?> getCollectionByCollectionId(
      String collectionId) async {
    var res = await NetworkManager().get(
        '/memberResaleCollection/findResaleCollectionByCollectionId',
        queryParameters: {'collectionId': collectionId});

    CollectionDetailBean? result;
    if (res.success && res.data != null) {
      result = CollectionDetailBean.fromJson(res.data);
    }
    return result;
  }

  /// 获取藏品给挂单列表 /collection/findResaleCollectionByPage?collectionId=1841013748521762816&propertie=resale_price&pageSize=20&pageNum=1&direction=desc
  Future<CollectionPendingOrdersListBean?> getCollectionOrderByPage(
    String collectionId, {
    String propertie = 'resale_price',
    String direction = 'desc',
    int pageNum = 1,
    int pageSize = 20,
  }) async {
    var res = await NetworkManager()
        .get('/collection/findResaleCollectionByPage', queryParameters: {
      'collectionId': collectionId,
      'propertie': propertie,
      'direction': direction,
      'pageNum': pageNum,
      'pageSize': pageSize,
    });

    CollectionPendingOrdersListBean? result;
    if (res.success && res.data != null) {
      result = CollectionPendingOrdersListBean.fromJson(res.data);
    }
    return result;
  }
}
