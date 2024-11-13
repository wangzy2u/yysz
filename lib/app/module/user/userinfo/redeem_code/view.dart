import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import 'package:nft_flutter/common/extensions/ex_string.dart';
import 'package:nft_flutter/common/extensions/ex_widget.dart';

import '../../../../../common/res/langs/text_key.dart';
import '../../../../../common/widgets/appbar_x.dart';
import '../../../../../common/widgets/login_input.dart';
import 'logic.dart';

class RedeemCodePage extends StatelessWidget {
  RedeemCodePage({super.key});

  final RedeemCodeLogic logic = Get.put(RedeemCodeLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppbar(title: '兑换码'),
      body: Column(children: [
        SizedBox(height: 8.w,),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 0.w),
          alignment: Alignment.centerLeft,
          child: TextKey.redeemCode.tr.smallContentText,
        ),
        SizedBox(height: 8.w,),
        LoginInput(
            onChanged: logic.onRedeemCode,
            inputType: TextInputType.name,
            hint: TextKey.changeRedeemCodeHint.tr).backgroundColor(5.skColor).clipRRect(all: 8),
        SizedBox(height: 8.w,),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 0.w),
          alignment: Alignment.centerLeft,
          child: TextKey.changeRedeemCodeSubTitle.tr.subTitleText,
        ),

        SizedBox(height: 40.w,),

        Obx(() {
          return  InkWell(
            onTap: (){
              logic.okRedeemCode();
            },
            child: Text(TextKey.okExchange.tr,style: TextStyle(
                fontSize: 14.sp,
                color: logic.isClick.value ? 2.skColor : 3.skColor
            ),).center(),
          ).fractionallySizedBox(widthFactor: 1).height(44.w).backgroundColor(logic.isClick.value ? 0.skColor : 4.skColor).clipRRect(all: 8);
        })

      ],).marginSymmetric(horizontal: 15.w),
    );
  }
}
