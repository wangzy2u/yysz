import 'package:get/get.dart';
import 'package:nft_flutter/app/event/user_update_event.dart';
import 'package:nft_flutter/app/module/user/bean/user_info_bean.dart';
import 'package:nft_flutter/app/module/user/login/bean/Login_result_bean.dart';
import 'package:nft_flutter/app/module/user/userinfo/mine/logic.dart';
import 'package:nft_flutter/app/network/api/account.dart';

import '../../../common/http/http/dio_new.dart';
import '../../data/global_service.dart';
import '../../network/network_manager.dart';

const kAccessToken = 'access_token';

class UserInfoManager extends GetxController {
  LoginResultBean loginResultBean = LoginResultBean();

  static final UserInfoManager _instance = UserInfoManager._internal();

  factory UserInfoManager() => _instance;

  UserInfoManager._internal();

  final MineLogic logic = Get.put(MineLogic());

  bool get isLogin {
    return NetworkManager().token.isNotEmpty;
  }

  UserInfoBean? userInfoBean;

  void logout() {
    NetworkManager().token = '';
    loginResultBean = LoginResultBean();
  }

  void loginSuccess(LoginResultBean result) {
    NetworkManager().token = result.tokenValue ?? '';
    NetworkManager().accountId = result.accountId ?? '';
    loginResultBean = result;
    updateUserInfo();
  }

  Future<UserInfoBean?> updateUserInfo() async {
    print('是否登录$isLogin');
    if (!isLogin) {
      return null;
    }

    try {


      var response = await NetworkManager().getUserInfo();
      if (response.success) {
        userInfoBean = UserInfoBean.fromJson(response.data);
        logic.getMyAssets();
        //需要考虑登录成功后，再次进入app的时候如何获取用户信息数据
        update(["MineUserInfo"]); // 更新我的页面用户信息

        GlobalService.to.eventBus.fire(UserUpdateEvent(userInfoBean));
      }

      // update();
    } on DMRequestException catch (e) {
      // ppp(e.toString(), current: StackTrace.current);
      // toastError(e.message);
    }

    return userInfoBean;
  }
}
