import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nft_flutter/app/network/api/brand_api.dart';

import '../../../common/http/http/src/http_exceptions.dart';
import '../../network/network_manager.dart';
import '../home/bean/Issuer_list_bean.dart';
import 'bean/brand_collection_list_bean.dart';
import 'bean/collection_detail_bean.dart';

//品牌详情
class BrandDetailsLogic extends GetxController {
  final appBarOpacity = 0.0.obs; // 初始化透明度为 0
  final ScrollController scrollController = ScrollController();

  String issuerId = '';

  IssuerItemBean? brandDetail;

  List<CollectionDetailBean> brandCollectionList = [];

  bool isShowEmpty = false;

  int pageNum = 1;

  @override
  void onInit() {
    super.onInit();

    scrollController.addListener(() {
      double alpha = scrollController.position.pixels.toDouble() / 100;

      if (alpha >= 1) {
        alpha = 1;
      }
      if (alpha <= 0) {
        alpha = 0;
      }

      appBarOpacity.value = alpha;
    });

    /// 拿到 issuerId
    issuerId = Get.arguments['id'] ?? '';

    getBrandDetail();

    getBrandCollectionList();
  }

  //获取详情
  void getBrandDetail() async {
    if (issuerId.isNotEmpty) {
      brandDetail = await NetworkManager().getBrandDetails(issuerId);
    }

    update();
  }

  Future<bool> getBrandCollectionList() async {
    bool isNoMores = true;

    try {
      if (issuerId.isNotEmpty) {
        BrandCollectionListBean? res = await NetworkManager()
            .getBrandCollectionList(issuerId, pageNum: pageNum);
        if (pageNum == 1) {
          brandCollectionList.clear();
        }

        if (res != null) {
          brandCollectionList.addAll(res.content ?? []);
          update();

          if (brandCollectionList.length < res.total) {
            isNoMores = false;
          } else {
            isNoMores = true;
          }
        }
      }
      isShowEmpty = true;
    } on DMRequestException catch (e) {
      if (brandCollectionList.isEmpty) {
        isShowEmpty = true;
      }
    }

    update();

    return isNoMores;
  }
}
