import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hb_password_input_textfield/hb_password_input_textfield.dart';
import 'package:nft_flutter/app/routes/app_routes.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import 'package:nft_flutter/common/widgets/icon_x.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../common/index.dart';

class PwdDialog extends StatelessWidget {
  const PwdDialog({super.key, this.title, this.content});

  final String? title;
  final String? content;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Container(
                color: 2.skColor,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 20.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Text(
                          title ?? '',
                          style: TextStyle(
                              color: 1.skColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500),
                        ).center(),
                        Container(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: IconX.icon(
                                Icons.close,
                                color: 1.skColor,
                                size: 22.w,
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.w,
                    ),
                    Text(
                      content ?? '',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: 3.skColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    Container(
                        child: Container(
                      margin: EdgeInsets.only(top: 12.w),
                      child: PinCodeTextField(
                        appContext: context,
                        length: 6,
                        obscuringCharacter: '*',
                        obscureText: true,
                        cursorColor: 1.skColor,
                        keyboardType: TextInputType.number,
                        animationType: AnimationType.fade,
                        textStyle: TextStyle(
                          color: 1.skColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                        pinTheme: PinTheme(
                          activeColor: 22.skColor,
                          selectedColor: 22.skColor.withOpacity(0.99),
                          inactiveColor: 22.skColor,
                          disabledColor: 22.skColor,
                          activeFillColor: 22.skColor,
                          selectedFillColor: 22.skColor,
                          errorBorderColor: 22.skColor,
                          inactiveFillColor: 22.skColor,
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(8.w),
                          fieldHeight: 44.w,
                          fieldWidth: 38.w,
                        ),
                        animationDuration: const Duration(milliseconds: 100),
                        enableActiveFill: true,
                        onCompleted: (text) {
                          print('Completed$text');
                          Get.back(result: text);
                        },
                        onChanged: (String text) {
                          print('onChanged$text');
                        },
                      ),
                    )),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '重新设置密码',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: 0.skColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400),
                      ).onTap(() {
                        Get.back();
                        Get.toNamed(AppRoutes.operationPwd);
                      }),
                    )
                  ],
                )).clipRRect(all: 16.w).margin(horizontal: 24.w),
          ],
        )
      ],
    );
  }
}
