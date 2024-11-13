import 'dart:io';

import 'package:get/get.dart';
import 'package:nft_flutter/app/network/api/account.dart';

import '../../../../common/utils/toast_util.dart';
import '../../../network/network_manager.dart';
import '../user_info_manager.dart';

class User_profileLogic extends GetxController {

  @override
  void onReady() {

    super.onReady();
  }

  void uploadFile(File file) async{
    var res  = await NetworkManager().uploadFile(uploadFile: file);
    if(res.success){
      ToastUtil.showToast('修改头像成功！');
      UserInfoManager().updateUserInfo();
      return;
    }
    ToastUtil.showToast(res.msg);
    UserInfoManager().updateUserInfo();
  }

}
