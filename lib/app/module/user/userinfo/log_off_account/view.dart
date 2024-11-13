import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nft_flutter/app/module/user/login/logic.dart';
import 'package:nft_flutter/app/module/user/user_info_manager.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import 'package:nft_flutter/common/extensions/ex_widget.dart';

import '../../../../../common/res/langs/text_key.dart';
import '../../../../../common/widgets/appbar_x.dart';
import '../../../../widgets/sms_input.dart';
import 'logic.dart';

class LogOffAccountPage extends StatelessWidget {
  LogOffAccountPage({Key? key}) : super(key: key);

  final LogOffAccountLogic logic = Get.put(LogOffAccountLogic());
  final LoginLogic logic2 = Get.put(LoginLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppbar(title: '注销账户申请'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Container(
          padding: EdgeInsets.only(left: 16.w, top: 16.w),
          child: Text(
            '用户身份验证',
            style:
            TextStyle(color: 1.skColor, fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 16.w, top: 16.w),
          child: Text(
            '注销账户：${UserInfoManager().userInfoBean?.mobile}',
            style:
            TextStyle(color: 3.skColor, fontSize: 14.sp, fontWeight: FontWeight.w600),
          ),
        ),
          Container(
            padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 8.w),
            height: 60,
              child: SmsInput(
            onChanged: logic2.onCodeChange,
            inputType: TextInputType.number,
            inputFormatter: [FilteringTextInputFormatter.digitsOnly],
            // 只允许输入数字
            hint: TextKey.verifyCodeHint.tr,
          ).backgroundColor(22.skColor).clipRRect(all: 8.w),
          ),
          Container(
            margin: EdgeInsets.only(
                left: 20.w, top: 16.w, right: 20.w),
            height: 1.w,
            color: 10.skColor,
          ),
          Container(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.w),
            child: Text(
              '账户注销后无法恢复，请谨慎操作，注销前请检查以下事项：',
              style:
              TextStyle(color: 1.skColor, fontSize: 14.sp, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 12.w),
            child: Text(
              '1.注销账号前，请先关闭钱包自动续费功能，并将钱包账户的余额全部提现。\n 2.您的账户中如果有未出售的数字资产，无法注销。\n 3.邀请奖励余额中有余额时，无法注销。 \n 4.账户注销后，账户下的订单记录无法找回，昵称、头像、钱包地址等个人信息均会被删除。 \n 5.注销后，该账户7天内将无法登录，且无法注册新用户。',
              style:
              TextStyle(color: 9.skColor, fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),
          ),
      Expanded(child: Text('')),
          Container(
            margin: EdgeInsets.only(left: 15.w, right: 15.w,bottom: 25.w),
            height: 40.w,
            decoration: BoxDecoration(
                color: 0.skColor,
                borderRadius: BorderRadius.all(Radius.circular(50))),
            child: const Center(
              child: Text(
                '验证身份并注销',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
      ],),
    );
  }
}
