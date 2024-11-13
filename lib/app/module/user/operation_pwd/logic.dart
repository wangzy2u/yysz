import 'package:captcha_plugin_flutter/captcha_plugin_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nft_flutter/app/module/user/bean/user_info_bean.dart';
import 'package:nft_flutter/app/module/user/user_info_manager.dart';
import 'package:nft_flutter/app/network/api/account.dart';
import 'package:nft_flutter/common/res/langs/text_key.dart';
import 'package:nft_flutter/common/utils/toast_util.dart';

import '../../../../common/http/http/src/http_exceptions.dart';
import '../../../../common/index.dart';
import '../../../../common/utils/regex_util.dart';
import '../../../data/common_const.dart';
import '../../../network/network_manager.dart';
import '../../../widgets/sms_code/count_down_logic.dart';

class OperationPwdLogic extends GetxController {
  final CaptchaPluginFlutter captchaPlugin = new CaptchaPluginFlutter();

  UserInfoBean? userInfoBean;
  final isClick = false.obs;
  String verifyCode = '';
  String newPwd = '';
  String newVerifyPwd = '';

  @override
  void onReady() {
    super.onReady();
    init();

    checkUserInfo();
  }

  void changeVerifyCode(String text) {
    verifyCode = text;
    checkInfo();
  }

  void changeNewPed(String text) {
    newPwd = text;
    checkInfo();
  }

  void changeVerifyNewPed(String text) {
    newVerifyPwd = text;
    checkInfo();
  }

  //检查输入内容
  checkInfo() {
    isClick.value = verifyCode.isNotEmpty &&
        newPwd.isNotEmpty &&
        newVerifyPwd.isNotEmpty &&
        (newPwd == newVerifyPwd);
  }

  //检查用户信息
  void checkUserInfo() async {
    userInfoBean = UserInfoManager().userInfoBean;

    userInfoBean ??= await UserInfoManager().updateUserInfo();
    update();
  }

  void setPwd() async {

    try {

      SmartDialog.showLoading();

      var result =
          await NetworkManager().modifyPayPwd(verifyCode, newPwd);
      SmartDialog.dismiss();
      if (result.success) {
        ToastUtil.showToast('设置成功');
        UserInfoManager().updateUserInfo();
        Get.back();
      }
    } on DMRequestException catch (e) {
      SmartDialog.dismiss();
      ToastUtil.showToast(e.msg);
    }



  }

  //发送验证码
  sendSms() async {
    if (!RegexUtil.isMobileSimple(userInfoBean?.mobile ?? '')) {
      ToastUtil.showToast(TextKey.incorrectPhoneNumber.tr);
      return;
    }
    var controller = Get.put(CountDownLogic());
    captchaPlugin.showCaptcha(
        onLoaded: () {},
        onSuccess: (dynamic data) async {
          if (data['result'] == 'true') {
            try {
              var res = await NetworkManager()
                  .sendModifySmsCode(userInfoBean?.mobile ?? '', data['validate']);
              if (res.success) {
                ToastUtil.showToast('验证码已发送');

                controller.start(60);
              }
            } on DMRequestException catch (e) {
              ToastUtil.showToast(e.msg);
              controller.start(60);
            }
          }
        },
        onClose: (dynamic data) {},
        onError: (dynamic data) {});
  }

  ///初始化验证码
  void init() {
    CaptchaPluginConfig styleConfig = CaptchaPluginConfig(
        radius: 10,
        capBarTextColor: "#25D4D0",
        capBarTextSize: 18,
        capBarTextWeight: "bold",
        borderColor: "#25D4D0",
        borderRadius: 10,
        backgroundMoving: "#DC143C",
        executeBorderRadius: 10,
        executeBackground: "#DC143C",
        capBarTextAlign: "center",
        capPaddingTop: 10,
        capPaddingRight: 10,
        capPaddingBottom: 10,
        capPaddingLeft: 10,
        paddingTop: 15,
        paddingBottom: 15);

    captchaPlugin.init({
      "captcha_id": captchaId,
      "is_debug": true,
      "dimAmount": 0.8,
      "is_touch_outside_disappear": true,
      "timeout": 8000,
      "is_hide_close_button": false,
      "use_default_fallback": true,
      "failed_max_retry_count": 4,
      "is_close_button_bottom": true,
      'theme': 'light',
      "styleConfig": styleConfig.toJson(),
    });
  }

  @override
  void onClose() {
    super.onClose();
    Get.delete<CountDownLogic>();
  }
}
