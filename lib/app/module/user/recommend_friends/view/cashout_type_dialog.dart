import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import 'package:nft_flutter/common/extensions/ex_string.dart';

import '../../../../../common/widgets/icon_x.dart';
import '../../../../../common/widgets/image_x.dart';

class CashoutTypeDialog extends StatelessWidget {
  CashoutTypeDialog(String filterNameStr, {super.key});

  // final EcologyLogic logic = Get.put(EcologyLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 256.h,
        width: double.infinity,
        color: Colors.white,
        // decoration: const BoxDecoration(
        //     color: Colors.red,
        //     borderRadius: BorderRadius.all(Radius.circular(16))),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15.w, top: 20.w),
                child: Text(
                  '选择提现钱包',
                  style: TextStyle(
                      color: 1.skColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600),
                ),
              ),
              GestureDetector(onTap: (){
                Get.back(result: 'yibao');

              },child: Container(
                margin: EdgeInsets.only(left: 15.w, right: 15.w, top: 20.w),
                height: 76.w,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: 23.skColor,
                  borderRadius: BorderRadius.circular(10), // 设置圆角的半径
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: 16.w, right: 16.w, top: 3.w),
                          child: Row(
                            children: [
                              ImageX(
                                type: ImageType.asset,
                                image: 'lianlianqianbao_icon.png'.imagePath,
                                height: 44.w,
                                width: 44.h,
                              )
                            ],
                          ),
                        ),
                        Text(
                          '易宝钱包',
                          style: TextStyle(
                              color: 1.skColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 15.w),
                      // child: IconX.icon(Icons.circle_outlined),),
                      child: ImageX(
                        type: ImageType.asset,
                        image: 'circle_outlined.png'.imagePath,
                        height: 20.w,
                        width: 20.h,
                      ),
                    )
                  ],
                ),
              ),),
            ],
          ),
        ),
      ),
    );
  }

}
