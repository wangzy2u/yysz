

//购买或售卖须知
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import 'package:nft_flutter/common/extensions/ex_widget.dart';

class BuyOrSellInstructions extends StatelessWidget {
  const BuyOrSellInstructions({super.key, this.title, this.content});

  final String? title;
  final String? content;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 12.w),
      color: 2.skColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? '',
            style: TextStyle(
                color: 1.skColor, fontSize: 18.sp, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 12.w,),

          Text(
            content ?? '',
            style: TextStyle(
                color: 3.skColor, fontSize: 14.sp, fontWeight: FontWeight.w400),
          ),
        ],
      ),

    ).clipRRect(all:16.w).margin(horizontal: 15.w);;
  }
}
