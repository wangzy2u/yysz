import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nft_flutter/app/module/home/bean/banner_bean.dart';
import 'package:nft_flutter/app/network/api/home_api.dart';
import 'package:nft_flutter/common/utils/log_util.dart';

import '../../../common/base/base_controller_mixin.dart';
import '../../../common/http/http/src/http_exceptions.dart';
import '../../network/network_manager.dart';
import 'bean/Issuer_list_bean.dart';
import 'bean/entrance_bean.dart';
import 'bean/first_release_list_bean.dart';
import 'bean/notice_list_bean.dart';

class HomeLogic extends GetxController with BaseControllerMixin {
  double appBarDy = ScreenUtil().screenHeight;

  //banner
  List<BannerBean> bannerList = [];

  //公告
  List<NoticeItemBean> noticeList = [];

  //首页品牌列表
  List<IssuerItemBean> issuerList = [];
  //金刚位
  List<EntranceBean> entranceList = [];

  List<FirstReleaseItemBean> firstReleaseList = [];

  int pageNum = 1;

  final appTabIndex = 0.obs;

  late final PageController pageController;

  @override
  void onReady() {
    pageController = PageController(initialPage: appTabIndex.value);
    LoggerUtil.e('onReady');
    getBanner();
    getNotice();
    getHomeIssuer();
    getHomeFirst();

    getHomeEntrance();
    super.onReady();
  }

  //获取banner
  void getBanner() async {
    bannerList = await NetworkManager().getHomeBanner();

    update(['homeBanner']);
  }

  //获取公告
  void getNotice() async {
    noticeList = await NetworkManager().getHomeNotice();

    update(['noticeId']);
  }

  //获取品牌列表
  void getHomeIssuer() async {
    issuerList = await NetworkManager().getHomeIssuer();


    LoggerUtil.e('issuerList------');
    update(['issuerList']);
  }

  Future<bool> getHomeFirst() async {
    bool noMore = false;

    var res = await NetworkManager().getFirstReleaseList(pageNum: pageNum);

    if (res != null && res.content != null) {
      if (pageNum == 1) {
        firstReleaseList.clear();
      }

      firstReleaseList.addAll(res.content ?? []);

      if (res.total == null) {
        noMore = false;
      } else {
        if (firstReleaseList.length >= res.total!) {
          noMore = true;
        }
      }
    }

    update();

    return noMore;
  }

  //获取金刚位
  void getHomeEntrance() async {
    try{
      var res = await NetworkManager().findHomeEntrance();
      entranceList.clear();
      if(res.success && res.data != null){
        res.data.forEach((e){
          entranceList.add(EntranceBean.fromJson(e));
        });
      }

      update(['HomeDiamondBar']);
    }on DMRequestException catch (e) {
      // ToastUtil.showToast(e.msg);
    }

  }

  @override
  // TODO: implement builderId
  String get builderId => 'HomeLogic';
}
