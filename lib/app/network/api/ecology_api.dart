import 'package:nft_flutter/app/module/ecology/bean/eclolgy_filter_bean.dart';
import 'package:nft_flutter/app/network/network_manager.dart';

import '../../module/ecology/bean/eclolgy_list_bean.dart';

extension EcologyNetworkManager on NetworkManager {


  // http://175.27.138.121:8088/api/collection/findSecondaryMarketCollection?issuerId=1841772046288158720&commodityType=3&pageSize=20&pageNum=1
  /// 获取生态列表
  // Future<List<EcologyItemBean>> getEcologyList(
  //     {int pageNum = 1, int pageSize = 6,String ? commodityType,String ? issuerId}) async {
  //   var res = await NetworkManager().get('/collection/findSecondaryMarketCollection',
  //       queryParameters: {'pageNum': pageNum, 'pageSize': pageSize,'commodityType': commodityType, 'issuerId': issuerId});
  //
  //   List<EcologyItemBean> list = [];
  //   if (res.success && res.data != null) {
  //     EclolgyListBean noticeBean = EclolgyListBean.fromJson(res.data);
  //     if (noticeBean != null) {
  //       list = noticeBean.list ?? [];
  //     }
  //   }
  //   return list;
  // }

  /// 获取生态列表
  Future<EclolgyListBean?> getEcologyList(
      {int pageNum = 1, int pageSize = 10,String ? commodityType,String ? issuerId}) async {
    var res = await NetworkManager().get('/collection/findSecondaryMarketCollection',
        queryParameters: {'pageNum': pageNum, 'pageSize': pageSize,'commodityType': commodityType, 'issuerId': issuerId});
    EclolgyListBean ? result;
    if (res.success && res.data != null) {
      result = EclolgyListBean.fromJson(res.data);
    }
    return result;
  }

  // 获取生态列表筛选
  Future<List<EclolgyFilterItemBean>> getEcologyFilterList(
      {int pageNum = 1, int pageSize = 6,String? idStr}) async {
    var res = await NetworkManager().get('/collection/findIssuerByPage',
        queryParameters: {'pageNum': pageNum, 'pageSize': pageSize, 'issuerId' : idStr, 'commodityType' : '3'});
    List<EclolgyFilterItemBean> list = [];
    if (res.success && res.data != null) {
      EclolgyFilterBean noticeBean = EclolgyFilterBean.fromJson(res.data);
      if (noticeBean.content != null) {
        list = noticeBean.content ?? [];
      }
    }
    return list;
  }



  // http://175.27.138.121:18080

  /// 获取首页banner
  // Future<List<BannerBean>> getHomeBanner() async {
  //   var res = await NetworkManager().get('/carousel/findCarousel');
  //   List<BannerBean> list = [];
  //   if (res.success && res.data != null) {
  //     for (var item in res.data) {
  //       list.add(BannerBean.fromJson(item));
  //     }
  //   }
  //   return list;
  // }
  //
  // /// 获取首页公告
  // Future<List<NoticeItemBean>> getHomeNotice(
  //     {int pageNum = 1, int pageSize = 6}) async {
  //   var res = await NetworkManager().get('/notice/findNoticeAbstractByPage',
  //       queryParameters: {'pageNum': pageNum, 'pageSize': pageSize});
  //
  //   List<NoticeItemBean> list = [];
  //   if (res.success && res.data != null) {
  //     NoticeListBean noticeBean = NoticeListBean.fromJson(res.data);
  //
  //     if (noticeBean.content != null) {
  //       list = noticeBean.content ?? [];
  //     }
  //   }
  //   return list;
  // }
  //
  // /// 获取首页品牌列表
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
  //
  //
  // /// 获取首发列表
  // Future<FirstReleaseListBean?> getFirstReleaseList(
  //     {int pageNum = 1, int pageSize = 6}) async {
  //   var res = await NetworkManager().get('/collection/getFirstReleaseCollections',
  //       queryParameters: {'pageNum': pageNum, 'pageSize': pageSize});
  //
  //   FirstReleaseListBean ? result;
  //   if (res.success && res.data != null) {
  //     result = FirstReleaseListBean.fromJson(res.data);
  //   }
  //   return result;
  // }


}
