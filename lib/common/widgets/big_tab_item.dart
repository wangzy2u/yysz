import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';

class BigTabItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final double? fontSize;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;

  const BigTabItem({
    required this.title,
    this.isSelected = false,
    this.fontSize,
    this.padding,
    this.height,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.w),
      child: GestureDetector(
        onTap: onPressed,
        child: Column(
          children: [
            Container(
              height: height ?? 45.w,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 7.w),
              // padding: padding ?? EdgeInsets.only(left: 15.w, right: 15.w, top: 10.w, bottom: 0),
              child: Text(
                title,
                style: TextStyle(
                  color: isSelected ? 1.skColor : 3.skColor,
                  fontSize: fontSize ?? 16.sp,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                ),
              ),
            ),
            // SizedBox(
            //   height: 10.w,
            // ),
            // Offstage(
            //   offstage: !isSelected,
            //   child: Container(
            //     width: 130.w,
            //     height: 3.w,
            //     color: 0.skColor,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
