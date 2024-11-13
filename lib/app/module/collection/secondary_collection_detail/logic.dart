import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nft_flutter/app/module/brand_details/bean/collection_detail_bean.dart';
import 'package:nft_flutter/app/network/api/collection_api.dart';
import 'package:nft_flutter/app/network/network_manager.dart';

import '../../../../common/http/http/src/http_exceptions.dart';
import '../../../../common/utils/toast_util.dart';
import '../../../routes/app_routes.dart';
import '../../../widgets/tips_dialog.dart';
import '../bean/secondary_collection_detail_bean.dart';
import '../consignment/bean/dict_item_bean.dart';

///二级藏品
class SecondaryCollectionDetailLogic extends GetxController {
  String id = '';
  SecondaryCollectionDetailBean? itemBean;
  final ScrollController scrollController = ScrollController();
  final appBarOpacity = 0.0.obs; // 初始化透明度为 0
//购买须知
  DictItemBean? dictItemBean;
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

    id = Get.arguments['id'];

    getCollectionDetails();
    findDictItemInCache();
  }

  //获取二级藏品信息
  void getCollectionDetails() async {
    if (id.isNotEmpty) {
      itemBean = await NetworkManager().findSecondaryCollectionById(id);
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
  //下单
  createCollectionOrder() async {
    try {
      var res =
      await NetworkManager().createSecondaryCollectionOrder(memberId: NetworkManager().accountId,orderType: REGULAR_ORDER,
      resaleCollectionId: itemBean?.id ?? ''
      );

      if (res.success) {
        Get.toNamed(AppRoutes.orderDetail,
            arguments: {'id': res.data.toString()});
      }
    } on DMRequestException catch (e) {
      if (e.code == 1001) {
        ToastUtil.showToast(e.msg);

        Get.dialog(TipsDialog(
          title: '提示',
          confirmTitle: '前往认证',
          content:
          '请先实名认证后，再进行购买。\n 根据《支付机构反洗钱和反恐怖融资管理办法》等法规要求，请先完成实名认证后再进行购买。',
          onPressed: (bool result) {
            if (result) {
              Get.toNamed(AppRoutes.userAuth);
            }
          },
        ));

        // Get.toNamed(AppRoutes.userAuth);
      }

      if (e.code == 1005) {
        if (e.errorExpands != null) {
          var data = e.errorExpands.first;

          if (data != null) {
            Get.dialog(TipsDialog(
              title: '购买失败',
              confirmTitle: '去支付',
              isHideCancel: true,
              content: '您存在一笔未支付的订单，请前往订单中心进行支付。',
              onPressed: (bool result) {
                if (result) {
                  Get.toNamed(AppRoutes.orderDetail,
                      arguments: {'id': data['value']});
                }
              },
            ));
          }
        }
      }
    }
  }
}
