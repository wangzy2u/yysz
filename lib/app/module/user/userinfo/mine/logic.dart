import 'package:get/get.dart';
import 'package:nft_flutter/app/network/api/account.dart';

import '../../../../network/network_manager.dart';
import 'package:flutter/cupertino.dart';

import 'Consignment_list_bean.dart';
import 'My_assets_list_bean.dart';

class MineLogic extends GetxController {
  final appTabIndex = 0.obs;

  final isLogin = false.obs;

  // 生态资产
  List<AssetsListItemBean> ecologicalAssetsList = [];

  // 自由资产
  List<AssetsListItemBean> freeAssetsList = [];

  // 寄售列表
  List<ConsignmentListItemBean> consignmentList = [];

  // 资产
  RxString assets = '0'.obs;
  // 收益
  RxString mygGain = '0'.obs;
  // 原石
  RxString mineNum = '0'.obs;

  GlobalKey? appBarKey = GlobalKey();

  @override
  void onReady() {
    getEcologicalAssets();
    // getMyBalance();
    getMyAssets();
    super.onReady();
  }

  // 生态资产
  void getEcologicalAssets() async {
    var res = await NetworkManager().getEcologicalAssetsList();
    if (res != null && res.list != null) {
      ecologicalAssetsList = res.list!;
    }
    update();
  }

  // 自由资产
  void getFreeAssets() async {
    var res = await NetworkManager().getFreeAssetsList();
    if (res != null && res.list != null) {
      freeAssetsList = res.list!;
    }
    update();
  }

  // 我的收益
  void getMyAssets() async {
    var res = await NetworkManager().getMyAssets();
    assets.value = '${res.data['assets']}';
    mygGain.value = '${res.data['mygGain']}';
    mineNum.value = '${res.data['mineNum']}';
    update();
  }

  // 获取我的资产
  void getMyBalance() async {
    var res = await NetworkManager().getMyBalance();
    if (res != null) {}
    update();
  }

  // 获取寄售列表
  void getConsignmentList(String collectionId) async {
    consignmentList = await NetworkManager()
        .findMyHoldCollectionByPage(collectionId: collectionId);
    // if(res != null){
    //   consignmentList  = res;
    // }
    update(['consignmentDialog']);
  }
}
