import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nft_flutter/app/module/buy/order_detail_page/logic.dart';
import 'package:nft_flutter/app/module/collection/consignment/item/pwd_dialog.dart';
import 'package:nft_flutter/app/module/user/bean/user_info_bean.dart';
import 'package:nft_flutter/app/module/user/user_info_manager.dart';
import 'package:nft_flutter/app/network/api/collection_api.dart';
import 'package:nft_flutter/app/network/api/order_api.dart';
import 'package:nft_flutter/app/network/network_manager.dart';
import 'package:nft_flutter/app/widgets/tips_dialog.dart';
import 'package:nft_flutter/common/extensions/ex_string.dart';
import 'package:nft_flutter/common/http/http/src/http_exceptions.dart';
import 'package:nft_flutter/common/utils/log_util.dart';
import 'package:nft_flutter/common/utils/num_util.dart';
import 'package:nft_flutter/common/utils/toast_util.dart';

import '../../../routes/app_routes.dart';
import '../../buy/order_detail_page/bean/Open_wallet_bean.dart';
import '../../buy/order_detail_page/bean/Pay_register_state_bean.dart';
import '../bean/secondary_collection_detail_bean.dart';
import 'bean/dict_item_bean.dart';
import 'item/sell_confirm_dialog.dart';

class ConsignmentLogic extends GetxController {
  final ScrollController scrollController = ScrollController();
  final appBarOpacity = 0.0.obs; // 初始化透明度为 0

  //藏品详情
  SecondaryCollectionDetailBean? itemBean;

  //用户钱包开通信息等
  PayRegisterStateBean? payRegisterStateBean;

  UserInfoBean? userInfoBean;

  //用户选择收款方式
  PayMethodsType? payMethodsType;

  //购买须知
  DictItemBean? dictItemBean;

  List<DictItemBean> transactionRatesList = [];

  //输入售价
  String? sellPrice;
  //手续费
  String? rates;
  //手续费费率
  String transactionRates = '0';
  //预计收入
  String estimatedIncome = '0';

  String id = '';

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
      appBarOpacity.value = alpha;
    });
    checkUserInfo();
    id = Get.arguments['id'];
    getPayMethods();
    getCollectionDetails();
    findDictItemInCache();
    findTransactionRates();
  }

  void checkUserInfo() async {
    userInfoBean = UserInfoManager().userInfoBean;

    userInfoBean ??= await UserInfoManager().updateUserInfo();
    update();
  }

  void onPriceChange(String price) {
    sellPrice = price;

    calculateTheBenefits();
  }



  void calculateTheBenefits(){


    rates = NumUtil.multiplyDecStr(sellPrice ?? '0', transactionRates).toString();
    estimatedIncome = NumUtil.subtractDecStr(sellPrice ?? '0', rates ?? '0').toString();
    update(['price']);
  }

  //获取藏品信息
  void getCollectionDetails() async {
    itemBean = await NetworkManager().findAssetsCollection(id);



    if(itemBean?.commodityType == '3'){
      sellPrice = '${itemBean?.guidingPrice}';
      calculateTheBenefits();
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


  //获取市场费率
  void findTransactionRates() async {
    var res  = await NetworkManager().findDictItemInCache(dictTypeCode: 'transactionRates');
    if(res.success){
      if(res.data != null){

        res.data.forEach((e){
         transactionRatesList.add(DictItemBean.fromJson(e)) ;
        });


        if(itemBean?.commodityType == '3'){
          DictItemBean item = transactionRatesList.firstWhere((element) => element.dictItemCode == 'ecologicalCollectionRates');
          transactionRates = item.dictItemName ?? '0';
        }else{
          DictItemBean item = transactionRatesList.firstWhere((element) => element.dictItemCode == 'freeProductRates');
          transactionRates = item.dictItemName ?? '0';
        }


      }
    }
    update();
  }


  //获取支付方式开通状态
  getPayMethods() async {
    try {
      var res =
          await NetworkManager().getPayRegister(NetworkManager().accountId);
      if (res.success) {
        payRegisterStateBean = PayRegisterStateBean.fromJson(res.data);
        update();
      }
    } on DMRequestException catch (e) {
      LoggerUtil.e(e);
    }
  }

  //开通易宝钱包
  openEbao() async {
    var openData = {
      "channel": "yibao",
      "data": {
        "type": "registerPurse",
        "data": {
          "merchantUserNo": NetworkManager().accountId,
          "returnUrl":
              "http://175.27.138.121:8090/#/pages/payOrderDetail/payOrderDetail?id=1851546845671587840"
        }
      }
    };
    try {
      var res = await NetworkManager().payment(openData);
      if (res.success) {
        OpenWalletBean openWalletBean = OpenWalletBean.fromJson(res.data);

        if (openWalletBean != null) {
          print(openWalletBean.url);

          Get.toNamed(
            AppRoutes.webView,
            parameters: {
              'url': openWalletBean.url ?? '',
              'title': '',
              'isShowBar': '1',
              'token': openWalletBean.token ?? '',
            },
          );

          // Get.dialog(PayMethodsDialog(
          //   payRegisterStateBean: payRegisterStateBean!,
          //   orderBean: orderBean,
          // ));
        }
      }
    } on DMRequestException catch (e) {
      LoggerUtil.e(e);
    }
  }


  void startSell() async {
    checkUserInfo();
    if(itemBean?.commodityType == '3'){
      sellPrimary();
    }else{
      sellCollection();
    }
  }

  ///一级藏品寄售
  void sellPrimary() async {
    if (payMethodsType == null) {
      ToastUtil.showToast('请选择收款账户');
      return;
    }
    /// 隐藏输入法
    FocusScope.of(Get.context!).requestFocus(FocusNode());

    /// 隐藏输入法
    FocusScope.of(Get.context!).unfocus();
    var ok = await Get.dialog(SellConfirmDialog(
      title: '确认寄售',
      cancelTitle: '取消寄售',
      price: '${itemBean?.guidingPrice ?? '0'}',
    ));

    /// 隐藏输入法
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    if (!ok) {
      return;
    }

    if (userInfoBean != null) {
      if (userInfoBean?.payPwd == null) {
        /// 隐藏输入法
        FocusScope.of(Get.context!).requestFocus(FocusNode());
        var res = await Get.dialog(TipsDialog(
          title: '提示',
          content: '为了您的账户安全，请设置操作密码后再进行寄售。点击【去设置】进入【操作密码】页面设置操作密码。 ',
          confirmTitle: '去设置',
        ));

        /// 隐藏输入法
        FocusScope.of(Get.context!).requestFocus(FocusNode());

        if (res) {
          Get.toNamed(AppRoutes.operationPwd);
          return;
        } else {
          return;
        }
      }
    }

    var pwd = await Get.dialog(const PwdDialog(
      title: '寄售',
      content: '请输入操作密码',
    ));
    /// 隐藏输入法
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    if (pwd != null && pwd.toString().isNotEmptyOrNull) {
      try {
        var res = await NetworkManager()
            .collectionResale('${itemBean?.guidingPrice ?? ''}', itemBean?.id ?? '', pwd);
        if (res.success) {
          ToastUtil.showToast('发布成功');
          Get.back(result: res.data);
        }
      } on DMRequestException catch (e) {
        ToastUtil.showToast(e.msg);
        LoggerUtil.e(e);
      }
    }
  }

  ///二级藏品寄售
  void sellCollection() async {
    if (sellPrice.isEmptyOrNull) {
      ToastUtil.showToast('请输入售价');
      return;
    }

    if (payMethodsType == null) {
      ToastUtil.showToast('请选择收款账户');
      return;
    }

    /// 隐藏输入法
    FocusScope.of(Get.context!).requestFocus(FocusNode());

    /// 隐藏输入法
    FocusScope.of(Get.context!).unfocus();
    var ok = await Get.dialog(SellConfirmDialog(
      title: '确认寄售',
      cancelTitle: '取消寄售',
      price: sellPrice,
    ));

    /// 隐藏输入法
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    if (!ok) {
      return;
    }

    if (userInfoBean != null) {
      if (userInfoBean?.payPwd == null) {
        /// 隐藏输入法
        FocusScope.of(Get.context!).requestFocus(FocusNode());
        var res = await Get.dialog(TipsDialog(
          title: '提示',
          content: '为了您的账户安全，请设置操作密码后再进行寄售。点击【去设置】进入【操作密码】页面设置操作密码。 ',
          confirmTitle: '去设置',
        ));

        /// 隐藏输入法
        FocusScope.of(Get.context!).requestFocus(FocusNode());

        if (res) {
          Get.toNamed(AppRoutes.operationPwd);
          return;
        } else {
          return;
        }
      }
    }

    var pwd = await Get.dialog(const PwdDialog(
      title: '寄售',
      content: '请输入操作密码',
    ));
    /// 隐藏输入法
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    if (pwd != null && pwd.toString().isNotEmptyOrNull) {
      try {
        var res = await NetworkManager()
            .collectionResale(sellPrice ?? '', itemBean?.id ?? '', pwd);
        if (res.success) {
          ToastUtil.showToast('发布成功');
          Get.back(result: res.data);
        }
      } on DMRequestException catch (e) {
        ToastUtil.showToast(e.msg);
        LoggerUtil.e(e);
      }
    }
  }
}
