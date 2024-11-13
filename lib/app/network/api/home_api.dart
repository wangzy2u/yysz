import 'package:nft_flutter/app/network/network_manager.dart';

import '../../../common/http/http/dio_new.dart';
import '../../module/home/bean/Issuer_list_bean.dart';
import '../../module/home/bean/banner_bean.dart';
import '../../module/home/bean/first_release_list_bean.dart';
import '../../module/home/bean/notice_list_bean.dart';

extension HomeNetworkManager on NetworkManager {
  // http://175.27.138.121:18080

  /// 获取首页banner
  Future<List<BannerBean>> getHomeBanner() async {
    var res = await NetworkManager().get('/carousel/findCarousel');
    List<BannerBean> list = [];
    if (res.success && res.data != null) {
      for (var item in res.data) {
        list.add(BannerBean.fromJson(item));
      }
    }
    return list;
  }

  /// 获取首页公告
  Future<List<NoticeItemBean>> getHomeNotice(
      {int pageNum = 1, int pageSize = 6}) async {
    var res = await NetworkManager().get('/notice/findNoticeAbstractByPage',
        queryParameters: {'pageNum': pageNum, 'pageSize': pageSize});

    List<NoticeItemBean> list = [];
    if (res.success && res.data != null) {
      NoticeListBean noticeBean = NoticeListBean.fromJson(res.data);

      if (noticeBean.content != null) {
        list = noticeBean.content ?? [];
      }
    }
    return list;
  }

  /// 获取首页品牌列表
  Future<List<IssuerItemBean>> getHomeIssuer(
      {int pageNum = 1, int pageSize = 6}) async {
    var res = await NetworkManager().get('/collection/findIssuerByPage',
        queryParameters: {'pageNum': pageNum, 'pageSize': pageSize});

    List<IssuerItemBean> list = [];
    if (res.success && res.data != null) {
      IssuerListBean noticeBean = IssuerListBean.fromJson(res.data);

      if (noticeBean.content != null) {
        list = noticeBean.content ?? [];
      }
    }
    return list;
  }


  /// 获取首发列表
  Future<FirstReleaseListBean?> getFirstReleaseList(
      {int pageNum = 1, int pageSize = 10}) async {
    var res = await NetworkManager().get('/collection/getFirstReleaseCollections',
        queryParameters: {'pageNum': pageNum, 'pageSize': pageSize});

    FirstReleaseListBean ? result;
    if (res.success && res.data != null) {
      result = FirstReleaseListBean.fromJson(res.data);
    }
    return result;
  }
  /// 获取金刚位
  Future<HttpResponse> findHomeEntrance() async {
    var res = await NetworkManager().get('/homeEntrance/findHomeEntrance');

    // FirstReleaseListBean ? result;
    // if (res.success && res.data != null) {
    //   result = FirstReleaseListBean.fromJson(res.data);
    // }
    return res;
  }

//首发
//http://175.27.138.121:18080?pageSize=5&pageNum=1

}
