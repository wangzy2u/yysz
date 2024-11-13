import '../../../common/http/http/dio_new.dart';
import '../../module/brand_details/bean/brand_collection_list_bean.dart';
import '../../module/brand_details/bean/collection_detail_bean.dart';
import '../../module/home/bean/Issuer_list_bean.dart';
import '../network_manager.dart';

///品牌相关
extension BrandNetworkManager on NetworkManager {
  /// 获取品牌详情 http://175.27.138.121:8088/api/collection/findIssuerById?id=1841772046288158720&pageNum=1&pageSize=10
  Future<IssuerItemBean?> getBrandDetails(String id,
      {int pageNum = 1, int pageSize = 5}) async {
    var res = await NetworkManager().get('/collection/findIssuerById',
        queryParameters: {'id': id, 'pageNum': pageNum, 'pageSize': pageSize});

    IssuerItemBean? result;

    // List<BannerBean> list = [];
    if (res.success && res.data != null) {
      result = IssuerItemBean.fromJson(res.data);
    }
    return result;
  }

  /// 获取品牌藏品列表 http://175.27.138.121:8088/api/collection/findCollectionByPage?issuerId=1841772046288158720&pageSize=5&pageNum=1
  Future<BrandCollectionListBean?> getBrandCollectionList(String id,
      {int pageNum = 1, int pageSize = 10}) async {
    var res = await NetworkManager().get('/collection/findCollectionByPage',
        queryParameters: {
          'issuerId': id,
          'pageNum': pageNum,
          'pageSize': pageSize
        });

    BrandCollectionListBean? result;

    // List<BannerBean> list = [];
    if (res.success && res.data != null) {
      result = BrandCollectionListBean.fromJson(res.data);
    }
    return result;
  }
}
