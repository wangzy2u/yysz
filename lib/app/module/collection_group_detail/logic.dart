import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nft_flutter/app/network/api/collection_api.dart';
import 'package:nft_flutter/app/network/api/hall_api.dart';
import 'package:nft_flutter/app/network/network_manager.dart';
import 'package:nft_flutter/app/widgets/tips_dialog.dart';
import 'package:nft_flutter/common/extensions/ex_string.dart';
import 'package:nft_flutter/common/utils/toast_util.dart';

import '../../../common/http/http/src/http_exceptions.dart';
import '../../routes/app_routes.dart';
import '../brand_details/bean/collection_detail_bean.dart';
import 'bean/collection_pending_orders_list_bean.dart';

class CollectionGroupDetailLogic extends GetxController {
  String collectionId = '';

  final ScrollController scrollController = ScrollController();
  final appBarOpacity = 0.0.obs; // 初始化透明度为 0

  CollectionDetailBean? detailBean;
  List<PendingOrderItemBean> orderList = [];

  final isPriceSort = true.obs; // 当前是否是价格排序
  final isAscending = false.obs; // 排序顺序

  final EasyRefreshController refreshController = EasyRefreshController(
    controlFinishRefresh: true,
    controlFinishLoad: true,
  );

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

    collectionId = Get.arguments['collectionId'];

    getCollectionDetails();

    getPendingOrders(1);
  }

  //价格排序
  void selectPrice() {
    if (isPriceSort.value) {
      isAscending.value = !isAscending.value; // 如果已选择价格排序，切换升降序
    } else {
      isPriceSort.value = true; // 否则改为按价格排序
      isAscending.value = false; // 默认升序
    }

    getPendingOrders(1);
  }

  //编号排序
  void selectNum() {
    if (!isPriceSort.value) {
      isAscending.value = !isAscending.value; // 如果已选择价格排序，切换升降序
    } else {
      isPriceSort.value = false; // 否则改为按价格排序
      isAscending.value = false; // 默认升序
    }

    getPendingOrders(1);
  }

  String getPriceIcon() {
    if (isPriceSort.value) {
      if (isAscending.value) {
        return 'icon_sorting_up.png'.skImagePath;
      } else {
        return 'icon_sorting_down.png'.skImagePath;
      }
    } else {
      return 'icon_sorting.png'.skImagePath;
    }
  }

  String getNumIcon() {
    if (!isPriceSort.value) {
      if (isAscending.value) {
        return 'icon_sorting_up.png'.skImagePath;
      } else {
        return 'icon_sorting_down.png'.skImagePath;
      }
    } else {
      return 'icon_sorting.png'.skImagePath;
    }
  }

  //获取藏品挂单详情
  void getCollectionDetails() async {
    if (collectionId.isNotEmpty) {
      detailBean =
          await NetworkManager().getCollectionByCollectionId(collectionId);
    }

    update();
  }

  Future<bool> getPendingOrders(int pageNum) async {
    bool isNoMores = true;

    CollectionPendingOrdersListBean? res = await NetworkManager()
        .getCollectionOrderByPage(collectionId,
            pageNum: pageNum,
            direction: isAscending.value ? 'asc' : 'desc',
            propertie: isPriceSort.value
                ? 'resale_price'
                : 'collection_serial_number');
    if (pageNum == 1) {
      orderList.clear();
    }
    if (res != null) {
      orderList.addAll(res.list ?? []);
      update();

      if (res.hasNextPage ?? false) {
        isNoMores = false;
        refreshController.finishLoad(IndicatorResult.success);
      } else {
        isNoMores = true;
        refreshController.finishLoad(IndicatorResult.noMore);
      }
    }

    update(['orderList']);

    return isNoMores;
  }

  //快捷下单
  fastCreateCollectionOrder() async {
    try {
      var res = await NetworkManager().createSecondaryCollectionOrder(
          memberId: NetworkManager().accountId,
          orderType: QUICK_ORDER,
          collectionId: collectionId);

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
