import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:nft_flutter/app/module/buy/order_detail_page/item/pay_methods_dialog.dart';
import 'package:nft_flutter/app/module/user/bean/user_info_bean.dart';
import 'package:nft_flutter/app/module/user/user_info_manager.dart';
import 'package:nft_flutter/app/network/api/order_api.dart';
import 'package:nft_flutter/app/routes/app_routes.dart';
import 'package:nft_flutter/common/extensions/ex_string.dart';
import 'package:nft_flutter/common/utils/log_util.dart';
import 'package:nft_flutter/common/utils/toast_util.dart';

import '../../../../common/http/http/src/http_exceptions.dart';
import '../../../network/network_manager.dart';
import 'bean/Open_wallet_bean.dart';
import 'bean/Pay_info_bean.dart';
import 'bean/Pay_register_state_bean.dart';
import 'bean/pay_order_bean.dart';

enum PayMethodsType {
  yibao,
  yibaoFast,
  // lianlian,
  // lianlianFase,
}

class OrderDetailLogic extends GetxController {
  String id = '';

  DateTime? startTime;
  Duration countdownDuration = Duration(minutes: 15);
  Timer? countdownTimer;
  Duration remainingTime = Duration.zero;
  bool isOrderActive = true;

  String time = '';

  PayOrderBean? orderBean;
  PayRegisterStateBean? payRegisterStateBean;

  @override
  void onInit() {
    super.onInit();

    id = Get.arguments['id'];
    getOrderDetail();
  }

  //获取订单详情
  getOrderDetail() async {
    try {
      var res = await NetworkManager().getMyParOrderDetail(id);
      if (res.success) {
        orderBean = PayOrderBean.fromJson(res.data);

        if (orderBean?.state == '1') {
          startCountdown();
        }
      }
      update();
    } on DMRequestException catch (e) {
      LoggerUtil.e(e);
    }
  }

  //一级藏品 支付-
  payOrder(PayMethodsType type) async {
    var payData = {
      "channel": "yibao",
      "data": {
        "type": "pushOrder",
        "data": {
          "orderId": orderBean?.id,
          "orderAmount": "0.01",
          "goodsName": "收拾收拾",
          "memberId": NetworkManager().accountId,
          "returnUrl": "http://yysz_app/pay/result",
          "limitPayType": type == PayMethodsType.yibao ? "WALLET_PAY" : "YJZF"
        }
      }
    };

    try {
      var res = await NetworkManager().payment(payData);
      if (res.success) {
        PayInfoBean openWalletBean = PayInfoBean.fromJson(res.data);

        if (openWalletBean != null) {
          print(openWalletBean.cashierUrl);

          Get.toNamed(
            AppRoutes.webView,
            parameters: {
              'url': openWalletBean.cashierUrl ?? '',
              'title': '',
              'isShowBar': '1',
              'token': openWalletBean.uniqueOrderNo ?? '',
            },
          );
        }
      }
    } on DMRequestException catch (e) {
      if (e.msg != null) {
        ToastUtil.showToast(e.msg);
      }

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

  //取消订单
  cancelOrder() async {
    try {
      var res = await NetworkManager()
          .cancelOrder(orderBean?.id ?? '', NetworkManager().accountId);
      if (res.success) {
        ToastUtil.showToast('取消成功');
        Get.back();
      }
    } on DMRequestException catch (e) {
      LoggerUtil.e(e);
    }
  }

  //获取支付方式开通状态
  getPayMethods() async {
    try {
      var res =
          await NetworkManager().getPayRegister(NetworkManager().accountId);
      if (res.success) {
        payRegisterStateBean = PayRegisterStateBean.fromJson(res.data);

        if (payRegisterStateBean != null) {
          var type = await Get.dialog(PayMethodsDialog(
            payRegisterStateBean: payRegisterStateBean!,
            orderBean: orderBean,
          ));
          if (type != null) {
            payOrder(type);
          }
          // Get.bottomSheet(PayMethodsDialog(payRegisterStateBean: payRegisterStateBean!,orderBean: orderBean,),isScrollControlled: true);
        }
      }
    } on DMRequestException catch (e) {
      LoggerUtil.e(e);
    }
  }

  //开始倒计时
  void startCountdown() {
    if (orderBean != null && orderBean!.createTime.isNotEmptyOrNull) {
      startTime = DateTime.parse(orderBean?.createTime ?? '');

      DateTime now = DateTime.now();

      if (orderBean?.surplusSecond != null) {
        countdownDuration =
            Duration(seconds: (orderBean?.surplusSecond ?? 900).toInt() + 2);
      }

      DateTime endTime = startTime!.add(countdownDuration);
      remainingTime = endTime.difference(now);

      time =
          '00:${remainingTime.inMinutes.toString().padLeft(2, '0')}:${(remainingTime.inSeconds % 60).toString().padLeft(2, '0')}';

      if (remainingTime.isNegative) {
        isOrderActive = false; // 倒计时已过，更新订单状态
        time = '';
        update();
      } else {
        countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
          time =
              '00:${remainingTime.inMinutes.toString().padLeft(2, '0')}:${(remainingTime.inSeconds % 60).toString().padLeft(2, '0')}';
          print(time);
          remainingTime -= Duration(seconds: 1);
          if (remainingTime <= Duration.zero) {
            countdownTimer?.cancel();
            isOrderActive = false; // 倒计时结束，更新订单状态
            time = '';
            getOrderDetail();
          }
          update();
        });
      }

      update();
    }
  }

  @override
  void onClose() {
    super.onClose();
    if (countdownTimer != null && countdownTimer!.isActive) {
      countdownTimer!.cancel();
    }
  }
}
