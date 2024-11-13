import 'package:get/get.dart';
import 'package:nft_flutter/app/module/user/login/logic.dart';
import 'package:nft_flutter/app/network/api/account.dart';
import 'package:nft_flutter/app/network/network_manager.dart';
import 'package:nft_flutter/common/utils/toast_util.dart';

class RedeemCodeLogic extends GetxController {
  final  isClick = false.obs;
  String redeemCode = '';

  void onRedeemCode(String text) {
    redeemCode = text;
    isClick.value = text.isNotEmpty;
  }

  // 确认兑换
  void okRedeemCode() async {
    var res  = await NetworkManager().exchangeCode(redeemCode);
    if(res != null){
        ToastUtil.showToast(res.msg);
    }
    update();
  }
}
