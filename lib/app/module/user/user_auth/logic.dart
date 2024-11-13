import 'dart:io';

import 'package:alive_flutter_plugin/alive_flutter_plugin.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nft_flutter/app/data/common_const.dart';
import 'package:nft_flutter/app/module/user/bean/user_info_bean.dart';
import 'package:nft_flutter/app/module/user/user_info_manager.dart';
import 'package:nft_flutter/app/network/api/account.dart';
import 'package:nft_flutter/app/network/api/order_api.dart';
import 'package:nft_flutter/app/network/api/public_api.dart';
import 'package:nft_flutter/common/extensions/ex_string.dart';
import 'package:nft_flutter/common/index.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../common/http/http/src/http_exceptions.dart';
import '../../../../common/utils/log_util.dart';
import '../../../../common/utils/permission_util.dart';
import '../../../../common/utils/toast_util.dart';
import '../../../network/network_manager.dart';
import '../../../routes/app_routes.dart';
import '../../buy/order_detail_page/bean/Pay_register_state_bean.dart';
import '../../main_tab/bean/city_bean.dart';
import 'item/city_picker.dart';

class UserAuthLogic extends GetxController {
  List<CityBean> cityList = [];

  final isClick = false.obs;

  String name = '';
  String idType = '';
  String idNum = '';
  String mobile = '';
  String address = '';
  String token = '';

  final AliveFlutterPlugin aliveFlutterPlugin =  AliveFlutterPlugin();


  UserInfoBean? userInfoBean;
  PayRegisterStateBean? registerStateBean;

  @override
  void onReady() {
    super.onReady();
    // aliveFlutterPlugin.init("2b2f1ab651fe40ef9cf5290b2fdbef7d", 30);

    getCityInfo();
    mobile = UserInfoManager().userInfoBean?.mobile ?? '';

    getUserInfo();
  }


  void getUserInfo() async{
    userInfoBean =UserInfoManager().userInfoBean;
    userInfoBean ??= await UserInfoManager().updateUserInfo();

    if(userInfoBean?.authStatus == 1){
      getPayMethods();
    }else{
      update();
    }
  }


  //获取支付方式开通状态
  getPayMethods() async {
    try {
      var res =
      await NetworkManager().getPayRegister(NetworkManager().accountId);
      if (res.success) {
        registerStateBean = PayRegisterStateBean.fromJson(res.data);

      }

      update();
    } on DMRequestException catch (e) {
      LoggerUtil.e(e);
      update();
    }
  }



  void startVerify() async {
    if (!isClick.value) return;

    if (Platform.isIOS) {
      // iOS 端sdk会获取权限提示
      faceVerify();
      return;
    } else {
      var ok = await PermissionUtil.camera();
      if (ok) {
        faceVerify();
      }
    }
  }

  void faceVerify() {
    // Get.toNamed(AppRoutes.alivePage);
    Get.toNamed(AppRoutes.faceVerify)?.then((result) {
      if (result != null) {
        token = result;
        auth();
        // ToastUtil.showToast(result);
      }
    });
  }

  void auth() async {
    var data = {
      "name": name,
      "cardNo": idNum,
      "mobile": mobile,
      "token": token,
      "accountId": NetworkManager().accountId,
      "businessType": "app",
      "address": address
    };

    try {
      SmartDialog.showLoading();
      var res = await NetworkManager().userVerifyAuth(data);
      SmartDialog.dismiss();

      ToastUtil.showToast('认证成功');
      UserInfoManager().updateUserInfo();
      Get.back();
    } on DMRequestException catch (e) {
      SmartDialog.dismiss();
      ToastUtil.showToast(e.msg);
    }
  }

  void changeName(String text) {
    name = text;
    checkInfo();
  }

  void changeIdNum(String text) {
    idNum = text;
    checkInfo();
  }

  void changeMobile(String text) {
    mobile = text;
    checkInfo();
  }

  checkInfo() {
    isClick.value = name.isNotEmpty &&
        idNum.isNotEmpty &&
        mobile.isNotEmpty &&
        address.isNotEmptyOrNull;
  }

  chooseArea() async {
    String result = await Get.bottomSheet(CityPicker(
      dataList: cityList,
    ));

    /// 隐藏输入法
    FocusScope.of(Get.context!).requestFocus(FocusNode());

    if (result.isNotEmptyOrNull) {
      address = result;
    }

    checkInfo();
    update();
  }

  getCityInfo() {
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

    List<CityBean> tempList = [];
    for (var v in res!) {
      tempList.add(CityBean.fromJson(v));
    }

    cityList.addAll(tempList);
    print(tempList);
  }
}
