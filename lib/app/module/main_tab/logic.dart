import 'dart:async';

import 'package:flutter/cupertino.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:nft_flutter/app/data/global_service.dart';
import 'package:nft_flutter/app/event/main_tab_event.dart';
import 'package:nft_flutter/app/module/main_tab/item/app_update_dialog.dart';
import 'package:nft_flutter/app/network/api/public_api.dart';
import 'package:nft_flutter/common/index.dart';
import 'package:nft_flutter/common/utils/app_util.dart';
import 'package:nft_flutter/common/utils/log_util.dart';

import '../../data/common_const.dart';
import '../../network/network_manager.dart';
import '../../routes/app_routes.dart';
import '../user/user_info_manager.dart';
import 'bean/app_update_bean.dart';
import 'bean/city_bean.dart';

class MainTabLogic extends GetxController {
  late final PageController pageController;

  int tabIndex = 0;

  final RxBool isLogin = false.obs;
  StreamSubscription? tabSubscription;

  @override
  void onInit() {
    super.onInit();

    tabSubscription = GlobalService.to.eventBus.on<MainTabEvent>().listen((event) {
      if (event.index != null) {
        changeToPage(event.index);
      }
    });

    isLogin.value = UserInfoManager().isLogin;
    pageController = PageController(initialPage: tabIndex);



  }

  void changeToPage(int index) {
    tabIndex = index;
    update();
    pageController.jumpToPage(index);

    if (index == 0) {
      getCityCode();
    }
  }

  @override
  void onReady() {
    UserInfoManager().updateUserInfo();

    getCityCode();

    super.onReady();

    getAppUpdate();



    //
    if(!UserInfoManager().isLogin){
      Get.toNamed(AppRoutes.login);
    }
  }

  void getCityCode() {
    var res = SpUtil.getObjectList(kCityLocalKey);

    if (res == null) {
      NetworkManager().getCityCode().then((value) {
        if (value.success) {
          List<CityBean> tempList = [];

          if (value.data != null) {
            value.data.forEach((v) {
              tempList.add(CityBean.fromJson(v));
            });
          }

          SpUtil.putObjectList(kCityLocalKey, tempList);

          print('城市信息$tempList');
        }
      });
    }
  }

  void getAppUpdate() async {
    var result = await NetworkManager().getUpdateInfo();

    if (result.success) {
      AppUpdateBean appUpdateBean = AppUpdateBean.fromJson(result.data);

      var info = await AppUtil.getPackageInfo();

      var versionCode = info.buildNumber;

      double? code = (versionCode ?? '0').toDouble();

      var updateCode = appUpdateBean.interversion ?? '0';

      if (updateCode.isNotEmptyOrNull) {
        if (updateCode.toDouble()! > code!) {
          Get.dialog(
              PopScope(
                canPop: true,
                child: AppUpdateDialog(
                  appUpdateBean: appUpdateBean,
                ),
              ),
              barrierDismissible: true);
        }
      }
    }
  }


  @override
  void onClose() {
    super.onClose();
    if(tabSubscription != null){
      tabSubscription?.cancel();
    }
  }
}
