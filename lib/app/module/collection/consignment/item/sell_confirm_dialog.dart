
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';

import '../../../../../common/index.dart';


///确认寄售弹窗
class SellConfirmDialog extends StatelessWidget {
  const SellConfirmDialog({super.key, this.title, this.content, this.height, this.confirmTitle, this.bgColor, this.price, this.cancelTitle});
  final String? title;
  final String? content;
  final String? price;
  final double? height;
  final String? confirmTitle;
  final String? cancelTitle;
  final Color? bgColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            color: bgColor ?? 2.skColor,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 24.w,horizontal: 20.w),
            child:  Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title ?? '',
                  style: TextStyle(
                      color: 1.skColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400),
                ),

                if(price != null)
                  Column(
                    children: [
                      SizedBox(height: 12.w,),
                      Text(
                        '￥$price',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: 1.skColor,
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),


                SizedBox(height: 10.w,),
                Text(
                  content ?? '你确定以$price元出售此数字资产吗？',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: 3.skColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 16.w,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back(result: false);

                      },
                      child: Container(
                        color: 4.skColor,
                        height: 40.w,
                        alignment: Alignment.center,
                        child: Text(
                          cancelTitle ?? '取消',
                          style: TextStyle(
                              color: 1.skColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ).clipRRect(all: 12.w),
                    ).expand(),
                    SizedBox(width: 12.w,),
                    InkWell(
                      onTap: () {
                        Get.back(result: true);
                      },
                      child: Container(
                        height: 40.w,
                        alignment: Alignment.center,
                        color: 0.skColor,
                        child: Text(
                          confirmTitle ?? '确定',
                          style: TextStyle(
                              color: 2.skColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ).clipRRect(all: 12.w),
                    ).expand(),
                  ],
                )
              ],
            )
        ).clipRRect(all: 16.w).margin(horizontal: 24.w)
      ],
    );
  }
}
