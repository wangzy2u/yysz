import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nft_flutter/app/widgets/sms_code/sms_code_view.dart';
import 'package:nft_flutter/app/widgets/sms_input.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import 'package:nft_flutter/common/extensions/ex_widget.dart';
import 'package:nft_flutter/common/res/langs/text_key.dart';
import 'package:nft_flutter/common/widgets/appbar_x.dart';

import '../../../widgets/line_widget.dart';
import '../../../widgets/text_input.dart';
import 'logic.dart';

///设置操作密码
class OperationPwdPage extends StatelessWidget {
  OperationPwdPage({Key? key}) : super(key: key);

  final OperationPwdLogic logic = Get.put(OperationPwdLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: 2.skColor,
      appBar: buildAppbar(title: '操作密码'),
      body: GetBuilder<OperationPwdLogic>(builder: (logic) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                height: 51.w,
                child: Row(
                  children: [
                    SizedBox(
                      width: 95.w,
                      child: Text(
                        '手机号',
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: 1.skColor,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Expanded(
                        child: Text(
                          logic.userInfoBean?.mobile ?? '',
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: 1.skColor,
                              fontWeight: FontWeight.w500),
                        ))
                  ],
                ),
              ),
              horizontalLine(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                height: 51.w,
                child: Row(
                  children: [
                    SizedBox(
                      width: 95.w,
                      child: Text(
                        '验证码',
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: 1.skColor,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Expanded(
                        child: SmsCodeView(
                          // onChanged: logic.onCodeChange,
                          inputType: TextInputType.number,
                          inputFormatter: [FilteringTextInputFormatter
                              .digitsOnly
                          ],
                          // 只允许输入数字
                          hint: TextKey.verifyCodeHint.tr,
                          onChanged: logic.changeVerifyCode,
                          onPressed: () {
                            logic.sendSms();
                          },
                        ))
                  ],
                ),
              ),

              horizontalLine(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                height: 51.w,
                child: Row(
                  children: [
                    SizedBox(
                      width: 95.w,
                      child: Text(
                        '新密码',
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: 1.skColor,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Expanded(
                        child: InputTextX(
                          hint: '请输入新的操作密码',
                          obscureText: true,
                          maxLength: 6,
                          inputType: TextInputType.number,
                          inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                          onChanged: logic.changeNewPed,
                        ))
                  ],
                ),
              ),
              horizontalLine(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                height: 51.w,
                child: Row(
                  children: [
                    SizedBox(
                      width: 95.w,
                      child: Text(
                        '确认密码',
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: 1.skColor,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Expanded(
                        child: InputTextX(
                          hint: '请再次确认操作密码',
                          obscureText: true,
                          maxLength: 6,
                          inputType: TextInputType.number,
                          inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                          onChanged: logic.changeVerifyNewPed,
                        ))
                  ],
                ),
              ),
              horizontalLine(),



              SizedBox(height: 40.w,),

              Obx(() {
                return InkWell(
                  onTap: () {
                    logic.setPwd();
                  },
                  child: Text(TextKey.login.tr, style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: logic.isClick.value ? 2.skColor : 3.skColor
                  ),).center(),
                ).fractionallySizedBox(widthFactor: 1)
                    .height(44.w)
                    .backgroundColor(logic.isClick.value ? 0.skColor : 4.skColor)
                    .clipRRect(all: 8).margin(horizontal: 15.w);
              }),
            ],
          ),
        );
      }),
    );
  }
}
