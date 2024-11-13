import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nft_flutter/app/routes/app_routes.dart';
import 'package:nft_flutter/app/widgets/sms_input.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import 'package:nft_flutter/common/extensions/ex_string.dart';
import 'package:nft_flutter/common/extensions/ex_widget.dart';
import 'package:nft_flutter/common/res/langs/index.dart';
import 'package:nft_flutter/common/utils/log_util.dart';
import 'package:nft_flutter/common/widgets/appbar_x.dart';
import 'package:nft_flutter/common/widgets/button_x.dart';
import 'package:nft_flutter/common/widgets/icon_x.dart';
import 'package:nft_flutter/common/widgets/image_x.dart';
import 'package:nft_flutter/common/widgets/login_input.dart';

import '../../../../common/index.dart';
import '../../../../common/widgets/double_press_back.dart';
import '../../../data/base_api.dart';
import 'logic.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final logic = Get.put(LoginLogic());

  @override
  Widget build(BuildContext context) {
    return DoublePressBackWidget(
      child: Scaffold(
        backgroundColor: 2.skColor,

        appBar: buildAppbar(
          iconLeft: Container(),
          onTab: (){

          }
        ),

        body: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              SizedBox(height: 12.w,),

              ImageX.asset('icon_logo_title.png'.imagePath,width: 99.w,),


              TextKey.loginTitle.tr.titleText.marginOnly(top: 32.w),
              SizedBox(height: 6.w,),
              TextKey.loginSubTitle.tr.subTitleText,
              SizedBox(height: 32.w,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 0.w),
                alignment: Alignment.centerLeft,
                child: TextKey.phoneNumber.tr.smallContentText,
              ),
              SizedBox(height: 8.w,),
              LoginInput(
                  onChanged: logic.onPhoneChange,
                  inputType: TextInputType.phone,
                  inputFormatter: [
                    FilteringTextInputFormatter.digitsOnly,
                    // 只允许输入数字
                  ],
                  hint: TextKey.phoneNumberHint.tr)
                  .backgroundColor(4.skColor)
                  .clipRRect(all: 8),

              SizedBox(height: 12.w,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 0.w),
                alignment: Alignment.centerLeft,
                child: TextKey.verifyCode.tr.smallContentText,
              ),

              SizedBox(height: 8.w,),
              SmsInput(
                onChanged: logic.onCodeChange,
                inputType: TextInputType.number,
                inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                // 只允许输入数字
                hint: TextKey.verifyCodeHint.tr,
              ).backgroundColor(4.skColor).clipRRect(all: 8.w),

              SizedBox(height: 12.w,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 0.w),
                alignment: Alignment.centerLeft,
                child: TextKey.inviteCode.tr.smallContentText,
              ),
              SizedBox(height: 8.w,),
              LoginInput(
                  onChanged: logic.onInviteCodeChange,
                  inputType: TextInputType.text,
                  inputFormatter: [
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
                    // 只允许输入字母和数字
                  ],
                  hint: '${TextKey.inviteCode.tr}(${TextKey.optional.tr})')
                  .backgroundColor(4.skColor)
                  .clipRRect(all: 8),

              SizedBox(height: 40.w,),


              Obx(() {
                return InkWell(
                  onTap: () {
                    logic.login();
                  },
                  child: Text(TextKey.login.tr, style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: logic.isClick.value ? 2.skColor : 3.skColor
                  ),).center(),
                ).fractionallySizedBox(widthFactor: 1)
                    .height(44.w)
                    .backgroundColor(logic.isClick.value ? 0.skColor : 4.skColor)
                    .clipRRect(all: 8);
              }),


              Stack(

                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GetBuilder<LoginLogic>(
                        id: 'isUserAgreed',
                        builder: (logic) {
                          return Container(
                            child: Builder(builder: (context) {
                              return InkWell(
                                onTap: () {
                                  logic.changeUserAgreed();
                                },
                                child: Container(
                                  padding: EdgeInsets.all(5.w),
                                  child: IconX.icon(logic.isUserAgreed
                                      ? Icons.check_circle
                                      : Icons.circle_outlined,
                                    color: logic.isUserAgreed ? 0.skColor : 3
                                        .skColor, size: 14.w,),
                                ),
                              );
                            }),
                          );
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 14.w),
                        child: RichText(
                          text: TextSpan(
                            text: '我已阅读并同意',
                            style: TextStyle(

                              color: 1.skColor,
                              fontSize: 12.sp,
                              height: 1.4,
                              fontWeight: FontWeight.w400,
                            ),
                            children: [
                              TextSpan(
                                text: '《用户协议》',
                                style: TextStyle(color: 0.skColor),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.toNamed(
                                      AppRoutes.webView,
                                      parameters: {
                                        'url': BaseApi.userAgreementUrl,
                                        'title': '用户协议',
                                        'isShowBar': '1',
                                      },
                                    );

                                    LoggerUtil.d('《用户协议》');
                                    // Get.toNamed(Routes.webView, parameters: {
                                    //   'url': BaseApi.userAgreementUrl.appUrl,
                                    //   'title': '2m用户协议',
                                    //   'isShowBar': '1',
                                    // });
                                  },
                              ),
                              TextSpan(
                                text: '和',
                                style: TextStyle(color: 1.skColor),
                              ),
                              TextSpan(
                                text: '《隐私政策》',
                                style: TextStyle(color: 0.skColor),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    LoggerUtil.d('《隐私政策》');
                                    // Get.toNamed(Routes.webView, parameters: {
                                    //   'url': BaseApi.privacyRightsUrl.appUrl,
                                    //   'title': '隐私政策',
                                    //   'isShowBar': '1',
                                    // });
                                  },
                              ),
                              TextSpan(
                                text: '，\n未注册的手机号验证后自动创建账户',
                                style: TextStyle(
                                    color: 2.skColor.withOpacity(0.5)),
                              ),
                            ],
                          ),
                        ),
                      )

                    ],
                  ),


                  Obx(() {
                    return SizedBox(
                      width: 88.w,
                      child: Stack(children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 28.w),
                          child: Container(
                            width: 10.w,
                            height: 10.w,
                            color: 4.skColor,
                            transform: Matrix4.rotationZ(pi / 4),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5.w),
                          width: 88.w,
                          height: 21.w,
                          decoration: BoxDecoration(
                            color: 4.skColor,
                            borderRadius: BorderRadius.all(Radius.circular(4.w)),
                          ),
                          alignment: Alignment.center,
                          child: Text('请阅读并同意协议',
                            style: TextStyle(color: 1.skColor, fontSize: 10.sp),),
                        ),
                      ]),
                    ).marginOnly(left: 2.w, top: 32.w).visibility(
                        visible: logic.isShowUserAgreedTips.value,maintainAnimation: true,maintainState: true);
                  })
                ],
              ),


            ],
          ).marginSymmetric(horizontal: 32.w),
        ),
      ),
    );
  }


// BuildContext ? scaleContext;
// void scalePoint(BuildContext context) {
//   SmartDialog.showAttach(
//     maskColor: Colors.transparent,
//     usePenetrate: true,
//
//     targetContext: context,
//     targetBuilder: (targetOffset, targetSize) {
//       return Offset(targetOffset.dx, targetOffset.dy);
//     },
//     alignment: Alignment.bottomCenter,
//     animationType: SmartAnimationType.scale,
//     scalePointBuilder: (selfSize) {
//       var halfWidth = (selfSize.width / 2);
//       return Offset(
//         halfWidth / 2,
//         10,
//       );
//     },
//     builder: (_) {
//       return SizedBox(
//         width: 88.w,
//         child: Stack(children: <Widget>[
//           Container(
//             margin:  EdgeInsets.only(left: 28.w),
//             child: Container(
//               width: 10.w,
//               height: 10.w,
//               color: 4.skColor,
//               transform: Matrix4.rotationZ(pi / 4),
//             ),
//           ),
//           Container(
//             margin:  EdgeInsets.only(top: 5.w),
//             width: 88.w,
//             height: 21.w,
//             decoration:  BoxDecoration(
//               color: 4.skColor,
//               borderRadius: BorderRadius.all(Radius.circular(4.w)),
//             ),
//             alignment: Alignment.center,
//             child:  Text('请阅读并同意协议',style: TextStyle(color: 1.skColor,fontSize: 10.sp),),
//           ),
//         ]),
//       ).marginOnly(left: 25.w);
//     },
//   );
// }
}
