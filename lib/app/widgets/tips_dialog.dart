import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nft_flutter/app/data/all_bindings.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import 'package:nft_flutter/common/extensions/ex_widget.dart';


class TipsDialog extends StatelessWidget {
  final String? title;
  final String? content;
  final double? height;
  final String? confirmTitle;
  final Color? bgColor;
  final bool  isHideCancel;
  final void Function(bool result)? onPressed;

  TipsDialog({Key? key, this.title, this.height = 280, this.content, this.confirmTitle, this.onPressed, this.bgColor, this.isHideCancel = false}) : super(key: key);

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
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 16.w,),
                Text(
                  content ?? '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: 1.skColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 16.w,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if(!isHideCancel)
                    InkWell(
                      onTap: () {
                        if(onPressed != null){
                          Get.back(result: false);
                          onPressed!(false);

                        }else{
                          Get.back(result: false);
                        }

                      },
                      child: Container(
                        color: 4.skColor,
                        height: 40.w,
                        alignment: Alignment.center,
                        child: Text(
                          '取消',
                          style: TextStyle(
                              color: 1.skColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ).clipRRect(all: 12.w),
                    ).margin(horizontal: 6.w).expand(),
                    InkWell(
                      onTap: () {
                        if(onPressed != null){
                          Get.back(result: true);
                          onPressed!(true);

                        }else{
                          Get.back(result: true);
                        }
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
                    ).margin(horizontal: 6.w).expand(),
                  ],
                )
              ],
            )
        ).clipRRect(all: 16.w).margin(horizontal: 24.w)
      ],
    );
  }
}
