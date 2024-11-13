import 'package:get/get.dart';
import 'package:nft_flutter/app/network/api/order_api.dart';

import '../../../network/network_manager.dart';
import 'bean/Airdrop_order_list_bean.dart';
import 'bean/consignment_list_bean.dart';
import 'bean/order_list_bean.dart';

class OrderListLogic extends GetxController {

  List<OrderListItemBean> orderList = [];
  List<OrderListItemBean> hallList = [];
  List<ConsignmentOrderListItemBean> consignmentList = [];
  List<AirdropOrderListItemBean> airdropList = [];

  @override
  void onReady() {
    getFindMyPayOrderByPage('', 'FIRST_LAUNCH');
    super.onReady();
  }

  void getFindMyPayOrderByPage(String state, String productType) async{
    orderList  = await NetworkManager().findMyPayOrderByPage(state: state, productType: productType);
    update(['OrderList']);
  }

  void getHallFindMyPayOrderByPage(String state, String productType) async{
    hallList  = await NetworkManager().findMyPayOrderByPage(state: state, productType: productType);
    update(['HallList']);
  }

  void getMyResaleCollectionByPage(String state, String productType) async{
    consignmentList  = await NetworkManager().findMyResaleCollectionByPage(state: state);
    update(['ConsignmentList']);
  }

  void getFindAirDropRecordHoldByPage(String state, String productType,bool isOnChain) async{
    airdropList  = await NetworkManager().findAirDropRecordHoldByPage(state: state, isOnChain: isOnChain);
    update(['AirdropList']);
  }

}
