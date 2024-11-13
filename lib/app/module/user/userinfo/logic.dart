import 'package:get/get.dart';
import 'package:nft_flutter/app/module/user/login/logic.dart';
import 'package:nft_flutter/app/module/user/user_info_manager.dart';
import 'package:nft_flutter/app/network/api/account.dart';

import '../../../../common/utils/toast_util.dart';
import '../../../network/network_manager.dart';
import '../../../routes/app_routes.dart';

class ChangeNicknameLogic extends GetxController {

  final  isClick = false.obs;
  String nickName = '';

  void onNicknameChange(String text) {
    nickName = text;
    isClick.value = text.isNotEmpty;
  }

  //修改昵称
  void changeNickname() async {
    var result = await NetworkManager().updateNickName(nickName);

    if(result.success){
      ToastUtil.showToast('修改成功');
      // Get.offAllNamed(AppRoutes.minePage);
      UserInfoManager().updateUserInfo();
      Get.back();
    }else{
      ToastUtil.showToast(result.msg);
    }
  }

}
