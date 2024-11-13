

import 'package:nft_flutter/app/module/brand_details/bean/collection_detail_bean.dart';
import 'package:nft_flutter/app/network/network_manager.dart';
import 'package:nft_flutter/common/http/http/src/http_response.dart';

import '../../module/collection/bean/secondary_collection_detail_bean.dart';

///常规下单
const REGULAR_ORDER = 'REGULAR_ORDER';
///一键下单
const QUICK_ORDER = 'QUICK_ORDER';
///藏品相关
extension CollectionApi on NetworkManager{

  /// 获取一级市场藏品信息 /collection/findCollectionById?id=1845652405249638400
  Future<CollectionDetailBean?> findCollectionById(String id) async {
    var res =await NetworkManager().get('/collection/findCollectionById',queryParameters:  {'id':id});

    CollectionDetailBean ? result;
    if (res.success && res.data != null) {
      result = CollectionDetailBean.fromJson(res.data);
    }
    return result;
  }


  /// 获取二级市场藏品信息
  Future<SecondaryCollectionDetailBean?> findSecondaryCollectionById(String id) async {
    var res =await NetworkManager().get('/collection/findResaleCollectionDetail',queryParameters:  {'id':id});

    SecondaryCollectionDetailBean ? result;
    if (res.success && res.data != null) {
      result = SecondaryCollectionDetailBean.fromJson(res.data);
    }
    return result;
  }

  /// 获取资产藏品详情信息/myArtwork/findMyResaleCollectionDetail?id=1852236497990713344
  Future<SecondaryCollectionDetailBean?> findAssetsCollection(String id) async {
    var res =await NetworkManager().get('/myArtwork/findMyHoldCollectionDetail',queryParameters:  {'id':id});

    SecondaryCollectionDetailBean ? result;
    if (res.success && res.data != null) {
      result = SecondaryCollectionDetailBean.fromJson(res.data);
    }
    return result;
  }

  /// 获取寄售藏品详情信息
  Future<SecondaryCollectionDetailBean?> findResaleCollection(String id) async {
    var res =await NetworkManager().get('/myArtwork/findMyResaleCollectionDetail',queryParameters:  {'id':id});

    SecondaryCollectionDetailBean ? result;
    if (res.success && res.data != null) {
      result = SecondaryCollectionDetailBean.fromJson(res.data);
    }
    return result;
  }


  ///寄售-- /transaction/collectionResale
  Future<HttpResponse> collectionResale(String resalePrice,String holdCollectionId,String payPwd) {
    var data = {
      'resalePrice': resalePrice,
      'holdCollectionId': holdCollectionId,
      'payPwd': payPwd,
    };
    return NetworkManager().post('/transaction/collectionResale',params: data);
  }


  /// 取消寄售 http://175.27.138.121:8088/api/transaction/cancelResale
  Future<bool> cancelResale(String id) async {
    var res =await NetworkManager().post('/transaction/cancelResale',params:  {'resaleCollectionId':id});

    bool  result;
    result = res.success;
    return result;
  }

  ///一级藏品-- 点击购买创建订单
  Future<HttpResponse> createCollectionOrder(String collectionId,String collectNumber) {
    var data = {
      'collectionId': collectionId,
      'collectNumber': collectNumber,
    };
    return NetworkManager().post('/transaction/latestCollectionCreateOrder',params: data);
  }

  ///二级藏品-- 点击购买创建订单
  ///	private String memberId;
  //
  // 	private String resaleCollectionId;
  //
  // 	private String orderType;
  //
  // 	private String collectionId;
  Future<HttpResponse> createSecondaryCollectionOrder({required String memberId,required String orderType,String? resaleCollectionId,String? collectionId}) {
    var data = {
      'memberId': memberId,
      'orderType': orderType,
      'resaleCollectionId': resaleCollectionId,
      'collectionId': collectionId,
    };


    return NetworkManager().post('/transaction/resaleCollectionCreateOrder',params: data);
  }



  //http://175.27.138.121:8088/api/dictconfig/findDictItemInCache?dictTypeCode=purchaseNotes
  ///获取购买须知
  Future<HttpResponse> findDictItemInCache({String? dictTypeCode = 'purchaseNotes'}) {
    var data = {
      'dictTypeCode': dictTypeCode,
    };
    return NetworkManager().get('/dictconfig/findDictItemInCache',queryParameters: data);
  }


  ///获取是否有优先购资格
  Future<HttpResponse> checkHasPreSale(String  collectionId) {
    var data = {
      'collectionId': collectionId,
    };
    return NetworkManager().get('/transaction/checkHasPreSale',queryParameters: data);
  }
}