import 'dart:async';

import 'package:captcha_plugin_flutter/captcha_plugin_flutter.dart';
import 'package:get/get.dart';
import 'package:nft_flutter/app/module/user/user_info_manager.dart';
import 'package:nft_flutter/app/network/api/account.dart';
import 'package:nft_flutter/app/network/network_manager.dart';
import 'package:nft_flutter/app/routes/app_routes.dart';
import 'package:nft_flutter/common/extensions/ex_string.dart';
import 'package:nft_flutter/common/http/http/src/http_exceptions.dart';
import 'package:nft_flutter/common/res/langs/index.dart';
import 'package:nft_flutter/common/utils/log_util.dart';
import 'package:nft_flutter/common/utils/regex_util.dart';
import 'package:nft_flutter/common/utils/toast_util.dart';

import '../../../../common/index.dart';
import '../../../data/common_const.dart';
import '../../main_tab/logic.dart';
import 'bean/Login_result_bean.dart';

class LoginLogic extends GetxController with BaseControllerMixin {
  final CaptchaPluginFlutter captchaPlugin = new CaptchaPluginFlutter();

  final smsBtnStr = '获取验证码'.obs;

  final isClick = false.obs;
  final isCodeClick = false.obs;

  bool isUserAgreed = false;
  final isShowUserAgreedTips = false.obs;

  Timer? timer;
  final count = 60.obs;

  String phone = '';
  String code = '';
  String inviteCode = '';


  bool isToMain = false;

  @override
  void onInit() {
    super.onInit();
    if(Get.arguments != null){
      isToMain = Get.arguments['isToMain'];
    }

    init();
  }

  void onPhoneChange(String text) {
    phone = text;
    isClick.value = GetUtils.isPhoneNumber(text) && isCodeClick.value;
  }

  void onCodeChange(String text) {
    code = text;
    isCodeClick.value = text.isNotEmpty && text.length >= 4;

    isClick.value = GetUtils.isPhoneNumber(phone) && isCodeClick.value;
  }

  void onInviteCodeChange(String text) {
    inviteCode = text;
  }

  //发送验证码
  void sendSms() async {
    if (!RegexUtil.isMobileSimple(phone)) {
      ToastUtil.showToast(TextKey.incorrectPhoneNumber.tr);
      return;
    }

    captchaPlugin.showCaptcha(
        onLoaded: () {},
        onSuccess: (dynamic data) async {
          if (data['result'] == 'true' || data['result']) {

            try{
              var res =
              await NetworkManager().sendSmsCode(phone, data['validate']);
              if (res.success) {
                ToastUtil.showToast('验证码已发送');
                startTimer();
              }
            }on DMRequestException catch (e) {
              ToastUtil.showToast(e.msg);
            }


          }else{
            ToastUtil.showToast(data.toString());
          }
        },
        onClose: (dynamic data) {},
        onError: (dynamic data) {});
  }

  //登录
  void login() async {
    if (!RegexUtil.isMobileSimple(phone)) {
      ToastUtil.showToast(TextKey.incorrectPhoneNumber.tr);
      return;
    }
    if (!code.isNotEmptyOrNull) {
      ToastUtil.showToast(TextKey.incorrectPhoneNumber.tr);
      return;
    }

    if (!isUserAgreed) {
      isShowUserAgreedTips.value = true;
      return;
    }

    try {
      var result =
          await NetworkManager().login(phone, code, inviteCode: inviteCode);

      if (result.success) {
        var user = LoginResultBean.fromJson(result.data);
        UserInfoManager().loginSuccess(user);
        back();
        if(isToMain){
          Get.toNamed(AppRoutes.mainTabPage);
        }
      }
    } on DMRequestException catch (e) {
      ToastUtil.showToast(e.msg);
    }
  }

  startTimer() {
    count.value = 60;
    if (timer != null) {
      timer?.cancel();
    }
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        count.value--;
        smsBtnStr.value = '${count.value}s';
        if (count.value <= 0) {
          timer.cancel();
          smsBtnStr.value = '重新获取';
        }
      },
    );
  }

  void changeUserAgreed() {
    isUserAgreed = !isUserAgreed;
    update(['isUserAgreed']);

    isShowUserAgreedTips.value = !isUserAgreed;

    // checkLoginEnable();
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
    if (timer != null) {
      timer?.cancel();
    }
  }

  @override
  String get builderId => 'LoginLogic';
}
