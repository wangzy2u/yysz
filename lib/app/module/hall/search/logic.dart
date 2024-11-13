import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nft_flutter/app/network/api/hall_api.dart';

import '../../../network/network_manager.dart';
import '../bean/secondary_market_collection_list.dart';

class SearchLogic extends GetxController {


  final searchController = TextEditingController();

//资产列表
  List<SecondaryMarketCollectionBean> marketCollectionList = [];



  Future<bool> search(String name,int pageNum,) async {

    bool isNoMores = true;
    SecondaryMarketCollectionList ? res =  await NetworkManager().getSecondaryMarketCollection(
        pageNum: pageNum,collectionName: name );
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


    return isNoMores;
  }
}
