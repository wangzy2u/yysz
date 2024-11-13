import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nft_flutter/app/network/api/collection_api.dart';
import 'package:nft_flutter/app/network/network_manager.dart';
import 'package:nft_flutter/app/routes/app_routes.dart';
import 'package:nft_flutter/app/widgets/tips_dialog.dart';
import 'package:nft_flutter/common/http/http/src/http_exceptions.dart';
import 'package:nft_flutter/common/utils/toast_util.dart';

import '../../user/userinfo/mine/Consignment_list_bean.dart';
import '../bean/secondary_collection_detail_bean.dart';
import '../consignment/bean/dict_item_bean.dart';

class AssetsCollectionDetailLogic extends GetxController {
  String id = '';
  String resaleId = '';

  ConsignmentListItemBean? fromBean;

  //购买须知
  DictItemBean? dictItemBean;

  SecondaryCollectionDetailBean? itemBean;

  final ScrollController scrollController = ScrollController();
  final appBarOpacity = 0.0.obs; // 初始化透明度为 0
  @override
  void onInit() {
    super.onInit();

    scrollController.addListener(() {
      double alpha = scrollController.position.pixels.toDouble() / 200;

      if (alpha >= 1) {
        alpha = 1;
      }
      if (alpha <= 0) {
        alpha = 0;
      }

      print('$alpha');
      appBarOpacity.value = alpha;
    });

    fromBean = Get.arguments['item'];
    id = fromBean?.id ?? '';
    resaleId = fromBean?.resaleId ?? '';
    getCollectionDetails();
    findDictItemInCache();
  }

  //获取藏品信息
  void getCollectionDetails() async {
    if (resaleId.isNotEmpty) {
      itemBean = await NetworkManager().findResaleCollection(resaleId);
    } else {
      itemBean = await NetworkManager().findAssetsCollection(id);
    }
    update();
  }
//获取购买须知
  void findDictItemInCache() async {
    var res  = await NetworkManager().findDictItemInCache();
    if(res.success){
      if(res.data != null){
        dictItemBean =  DictItemBean.fromJson(res.data.first);
      }
    }
    update();
  }


  //取消寄售
  void cancelConsignment() async {

   var result = await  Get.dialog(TipsDialog(title: '提示',content: '确认取消寄售吗？',));


   try{
     if(result){
       var ok = await NetworkManager().cancelResale(resaleId);
       if(ok){
         ToastUtil.showToast('取消成功');

         // resaleId = '';
         // getCollectionDetails();

         Get.until((route) => route.settings.name == AppRoutes.mainTabPage);
       }
     }
   }on DMRequestException catch (e){
     ToastUtil.showToast(e.msg);
   }





  }



}
