import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nft_flutter/app/data/all_bindings.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import 'package:nft_flutter/common/extensions/ex_widget.dart';

class TagItem extends StatelessWidget {
   TagItem({super.key, required this.title, this.height, this.radius, this.bgColor, this.titleColor, required this.selected});

  final String title;
  final double ? height;
  final double ? radius;
  final Color ? bgColor;
  final Color ? titleColor;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 28.w,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      // height: height ?? 28.w,
      color: selected ? 1.skColor : 5.skColor,
      child: Text(title,style: TextStyle(
          height: 1,
          fontSize: 14.sp,color: selected ? 2.skColor : 9.skColor),),
    ).constrained(minWidth: 52.w,maxWidth: 87.w).clipRRect(all: radius ?? 22.w);
  }
}
