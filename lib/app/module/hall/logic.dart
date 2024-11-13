import 'package:get/get.dart';
import 'package:nft_flutter/app/module/hall/bean/secondary_market_collection_list.dart';
import 'package:nft_flutter/app/network/api/hall_api.dart';
import 'package:nft_flutter/app/network/api/home_api.dart';

import '../../network/network_manager.dart';
import '../home/bean/Issuer_list_bean.dart';

class HallLogic extends GetxController {

  //品牌列表
  List<IssuerItemBean> issuerList = [];

  //资产列表
  List<SecondaryMarketCollectionBean> marketCollectionList = [];


  int selectIssuerIndex = 0;
  IssuerItemBean ? selectIssuer;


  @override
  void onReady() {
    super.onReady();

    getHomeIssuer();
      getHallList(1);


  }

  void filterHall(int  index){
    selectIssuerIndex = index;
    if(index < 0){
      return;
    }
    if(index == 0){
      selectIssuer = null;
    }
    if(index > 0 && issuerList.isNotEmpty ){
      selectIssuer = issuerList[index-1];
    }

    getHallList(1);
  }

  //获取品牌列表- 筛选框用
  void getHomeIssuer() async{
    issuerList = await NetworkManager().getHomeIssuer();
    update(['issuerList']);
  }


  Future<bool> getHallList(int pageNum) async {

    bool isNoMores = true;
    SecondaryMarketCollectionList ? res =  await NetworkManager().getSecondaryMarketCollection(pageNum: pageNum,issuerId:selectIssuer?.id ?? '' );
    if(pageNum == 1){
      marketCollectionList.clear();
    }
    if(res != null){
      marketCollectionList.addAll(res.list ?? []);
      update();

      if (res.hasNextPage ?? false) {
        isNoMores =  false;
      }else{
        isNoMores = true;
      }
    }

    update(['AssetsListView']);

    return isNoMores;
  }
}
