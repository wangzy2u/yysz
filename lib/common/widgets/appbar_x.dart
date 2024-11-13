import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import 'package:nft_flutter/common/extensions/ex_string.dart';
import 'package:nft_flutter/common/widgets/image_x.dart';

AppBar buildAppbar(
    {String? title,

      Widget? titleWidget,
    Widget? iconLeft,
    Function? onTab,
    String? leftTitle,
    String? rightTitle,
    String? rightImg,
    Function? rightOnTab,
    Color? bgColor,
    Color? rightColor,
      Color ? titleColor,
    double? height}) {
  return AppBar(
    surfaceTintColor: Colors.transparent,
    title: titleWidget ?? Text(
      title ?? '',
      style: TextStyle(color: titleColor ?? 1.skColor, fontSize: 18.sp, fontWeight: FontWeight.w500),
    ),
    centerTitle: true,
    elevation: 0,
    backgroundColor: bgColor ?? 2.skColor,
    actions: [
      if (rightTitle != null)
        Center(
          child: InkWell(
            onTap: () {
              rightOnTab?.call();
            },
            child: Padding(
              padding: EdgeInsets.only(right: 24.w),
              child: Text(
                rightTitle,
                style: TextStyle(color: rightColor ?? 2.skColor, fontSize: 30.sp, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      if (rightImg != null)
        Center(
          child: InkWell(
            onTap: () {
              rightOnTab?.call();
            },
            child: Padding(
              padding: EdgeInsets.only(right: 30.w),
              child: Image.asset(
                rightImg.skImagePath,
                // color: getColor(),
                width: 38.w,
              ),
            ),
          ),
        )
    ],
    leading: InkWell(
      onTap: () {
        if (onTab != null) {
          onTab.call();
        } else {
          Get.back();
        }
      },
      child: leftTitle == null
          ? Center(
              child: iconLeft ?? ImageX.asset('icon_back.png'.skImagePath,width: 20.w,),
            )
          : Center(
              child: Text(
                leftTitle,
                style: TextStyle(color: 1.skColor, fontSize: 30.sp, fontWeight: FontWeight.w500),
              ),
            ),
    ),
  );
}
