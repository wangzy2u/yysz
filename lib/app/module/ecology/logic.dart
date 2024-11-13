import 'package:get/get.dart';
import 'package:nft_flutter/app/network/api/ecology_api.dart';
import '../../network/network_manager.dart';
import 'bean/eclolgy_filter_bean.dart';
import 'bean/eclolgy_list_bean.dart';

class EcologyLogic extends GetxController {
  List<EcologyItemBean> ecologyList = [];
  List<EclolgyFilterItemBean> ecologyFilterList = [];
  String filterNameStr = '全部品牌';
  String currentIssuerId = '';
  int pageNum = 1;

  @override
  void onReady() {
    getEcologyList();
    getEcologyFilterList('');
    super.onReady();
  }

  Future<bool> getEcologyList() async {
    bool noMore = false;
    var res  = await NetworkManager().getEcologyList(pageNum: pageNum,issuerId: currentIssuerId, commodityType: '3');
    if(res != null && res.list != null){
      if(pageNum == 1){
        ecologyList.clear();
      }
      ecologyList.addAll(res.list ?? []);
      if(res.total == null){
        noMore = false;
      }else{
        if(ecologyList.length >= res.total!){
          noMore = true;
        }
      }
    }
    update(['ecologList']);
    return noMore;
  }

  void getEcologyFilterList(String idStr) async {
    ecologyFilterList =
        await NetworkManager().getEcologyFilterList(idStr: idStr);
    update(['ecologDialog']);
  }
}
