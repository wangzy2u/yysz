

import 'package:nft_flutter/app/data/base_api.dart';

import '../../../common/http/http/dio_new.dart';
import '../../module/user/userinfo/mine/assets_list_bean.dart';
import '../../network/network_manager.dart';

extension WMNetworkManager on NetworkManager {

  /// 获取公告详情-http://175.27.138.121:8088/api/notice/getNoticeDetail?id=1550337260958777344
  Future<HttpResponse> getAnnouncementDetail(String id) {

    return NetworkManager().get('/notice/getNoticeDetail',queryParameters: {'id':id});
  }


  /// 获取城市信息--http://test.yuanyushuzi.cn/payment/cityCode
  Future<HttpResponse> getCityCode() {

    return NetworkManager().get('http://test.yuanyushuzi.cn/payment/cityCode');
  }



  ///数字身份  /memberCard/findMemberCard?cardType=1
  Future<HttpResponse> findMemberCard(int cardType) {
    return NetworkManager().get('/memberCard/findMemberCard',queryParameters: {'cardType':cardType});
  }



  ///我的元石  /metastone/showMine
  Future<HttpResponse> findMineStone() {
    return NetworkManager().get('http://175.27.138.121:9012/metastone/showMine');
  }

  ///我的元石  http://175.27.138.121:9012/metastone/showPlatform
  Future<HttpResponse> showPlatform() {
    return NetworkManager().post('http://175.27.138.121:9012/metastone/showPlatform',contentType: NetworkManager.contentTypeJson,params: {});
  }


  ///检查更新  /?channel=1&updatePlanActive=1
  Future<HttpResponse> getUpdateInfo() {
    var data = {
      'channel' : 0,
      'updatePlanActive':1
    };
    return NetworkManager().get('/app/getAppversionInfo',queryParameters: data);
  }
}
