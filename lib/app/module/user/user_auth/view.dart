import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nft_flutter/app/widgets/line_widget.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import 'package:nft_flutter/common/extensions/ex_string.dart';
import 'package:nft_flutter/common/extensions/ex_widget.dart';
import 'package:nft_flutter/common/utils/text_util.dart';
import 'package:nft_flutter/common/widgets/appbar_x.dart';
import 'package:nft_flutter/common/widgets/image_x.dart';

import '../../../../common/widgets/icon_x.dart';
import '../../../widgets/text_input.dart';
import '../../buy/order_detail_page/bean/Pay_register_state_bean.dart';
import '../bean/user_info_bean.dart';
import 'logic.dart';

///实名认证
class UserAuthPage extends StatelessWidget {
  UserAuthPage({Key? key}) : super(key: key);

  final UserAuthLogic logic = Get.put(UserAuthLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: 2.skColor,
      appBar: buildAppbar(title: '实名认证'),
      body: GetBuilder<UserAuthLogic>(builder: (logic) {


        if(logic.userInfoBean?.authStatus == 1){
          return buildAuth(logic.registerStateBean);
        }

        return SingleChildScrollView(
          child: Column(
            children: [
              buildHeaderTips(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                height: 51.w,
                child: Row(
                  children: [
                    SizedBox(
                      width: 95.w,
                      child: Text(
                        '姓名',
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: 1.skColor,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Expanded(
                        child: InputTextX(
                      hint: '请输入真实姓名',
                      inputType: TextInputType.text,
                      onChanged: (name) {
                        logic.changeName(name);
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
                        '证件类型',
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: 1.skColor,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Expanded(
                        child: Text(
                      '身份证',
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: 1.skColor,
                          fontWeight: FontWeight.w400),
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
                        '身份证号',
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: 1.skColor,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Expanded(
                        child: InputTextX(
                      hint: '请输入身份证号',
                      inputType: TextInputType.text,
                      inputFormatter: [
                        LengthLimitingTextInputFormatter(18),
                        // 限制最多输入 18 位
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^[0-9]{0,17}[0-9Xx]?$')),
                        // 允许前 17 位数字，最后一位可为数字或 X/x
                      ],
                      onChanged: (name) {
                        logic.changeIdNum(name);
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
                        '手机号',
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: 1.skColor,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Expanded(
                        child: Text(
                      logic.mobile.isNotEmpty ? logic.mobile : '',
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: 1.skColor,
                          fontWeight: FontWeight.w400),
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
                        '地区信息',
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: 1.skColor,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        logic.chooseArea();
                      },
                      child: Text(
                        logic.address.isNotEmpty ? logic.address : '请使用定位选择',
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: 1.skColor,
                            fontWeight: FontWeight.w400),
                      ),
                    ))
                  ],
                ),
              ),
              horizontalLine(),
              SizedBox(
                height: 40.w,
              ),
              Obx(() {
                return InkWell(
                  onTap: () async {
                    logic.startVerify();
                  },
                  child: Container(
                    height: 44.w,
                    color: logic.isClick.value ? 0.skColor : 5.skColor,
                    width: double.infinity,
                    child: Text(
                      '下一步',
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: logic.isClick.value ? 2.skColor : 3.skColor,
                          fontWeight: FontWeight.w500),
                    ).center(),
                  ),
                );
              }).clipRRect(all: 8.w).marginSymmetric(horizontal: 15.w)
            ],
          ),
        );
      }),
    );
  }

  buildHeaderTips() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.w),
      color: 19.skColor.withOpacity(0.12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconX.image(
            'icon_auth_tips.png'.skImagePath,
            size: 14.w,
          ).marginOnly(top: 3.w),
          SizedBox(
            width: 6.w,
          ),
          Expanded(
              child: Text(
            '根据国家相关政策要求，你需要完成实名认证后再进行交易。你的信息将进行严格的隐私保护，请放心认证',
            style: TextStyle(
                fontSize: 12.sp,
                color: 19.skColor,
                fontWeight: FontWeight.w400),
          ))
        ],
      ),
    );
  }


  buildAuth(PayRegisterStateBean? registerStateBean){
    return Container(
      height: 150.w,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            31.skColor, // 第一种颜色
            32.skColor, // 第二种颜色
            33.skColor, // 第三种颜色
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),

      child: Stack(
        children: [

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '姓名',
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: 9.skColor,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 8.w,),
                  Text(
                    registerStateBean?.userName ?? '',
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: 1.skColor,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),


              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '身份证号',
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: 9.skColor,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 8.w,),
                  Text(
                    TextUtil.maskIDCard(registerStateBean?.idCardNo ?? ''),
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: 1.skColor,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),


            ],
          ).paddingSymmetric(horizontal: 20.w,vertical: 24.w),
          
          
          ImageX.asset('icon_auth_s.png'.skImagePath,width: 86.w,height: 96.w,).positioned(right: 20.w,top: 0,bottom: 0)
        ],
      ),
    ).clipRRect(all: 12.w).margin(horizontal: 15.w,vertical: 8.w);
  }
}
