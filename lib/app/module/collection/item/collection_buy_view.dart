import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nft_flutter/app/data/all_bindings.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import 'package:nft_flutter/common/extensions/ex_string.dart';
import 'package:nft_flutter/common/extensions/ex_widget.dart';
import 'package:nft_flutter/common/utils/date_util.dart';

import '../../../../common/index.dart';
import '../../../../common/utils/money_util.dart';
import '../../brand_details/bean/collection_detail_bean.dart';
import '../primary_collection_detail/logic.dart';
import 'buy_num_dialog.dart';

class CollectionBuyView extends StatelessWidget {
  const CollectionBuyView({super.key, this.onBuyPressed, this.saleTime, this.stock, this.price, this.priority = false});


  final String? saleTime;
  final num? stock;
  final num? price;
  final bool priority;

  final VoidCallback? onBuyPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 102.w,
      color: 2.skColor,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.w),
      alignment: Alignment.topCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: buildPrice(),
          ),

          Container(
            child: buildButton(),
          ),

        ],
      ),
    ).clipRRect(topRight: 16.w, topLeft: 16.w);
  }

  buildButton(){
    int tempTime = DateUtil.getDateMsByTimeStr(saleTime ?? '') ?? 0;


    if(tempTime > DateUtil.getNowDateMs()){
      return Container(

        color: priority ? 0.skColor :11.skColor.withOpacity(0.8),
        width: 188.w,
        height: 44.w,
        child: Text(priority ? '立即购买':'即将开售',style: TextStyle(color: 2.skColor,fontSize: 16.sp,fontWeight: FontWeight.w500),).center(),

      ).clipRRect(all: 22.w).onTap((){
        onBuyPressed?.call();
      });
    }else{

      if ((stock ?? 0) <= 0){
        return Container(

          color: 5.skColor,
          width: 188.w,
          height: 44.w,
          child: Text('已售罄',style: TextStyle(color: 1.skColor,fontSize: 16.sp,fontWeight: FontWeight.w500),).center(),

        ).clipRRect(all: 22.w);
      }else{
        return Container(
          color: 0.skColor,
          height: 44.w,
          width: 188.w,
          child: Text('立即购买',style: TextStyle(color: 2.skColor,fontSize: 16.sp,fontWeight: FontWeight.w500),).center(),
        ).clipRRect(all: 22.w).onTap(onBuyPressed);
      }
    }
  }


  buildPrice() {
    int tempTime = DateUtil.getDateMsByTimeStr(saleTime ?? '') ?? 0;

    if (tempTime > DateUtil.getNowDateMs()) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
              text: TextSpan(
                  text: '￥',
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: 11.skColor,
                      fontWeight: FontWeight.w500),
                  children: [
                TextSpan(
                  text: MoneyUtil.formatAmount('${price ?? 0}'),
                  style: TextStyle(
                      fontSize: 20.sp,
                      color: 11.skColor,
                      fontWeight: FontWeight.w500),
                )
              ])),
          Text(
            '${DateUtil.formatDateStr(saleTime ?? '', format: DateFormats.mo_d_h_m)}发售',
            style: TextStyle(
                fontSize: 12.w, color: 1.skColor, fontWeight: FontWeight.w400),
          )
        ],
      );
    } else {
      if ((stock ?? 0) <= 0) {
        return Container(
          alignment: Alignment.center,
          height: 44.w,
          child: RichText(
              text: TextSpan(
                  text: '￥',
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: 11.skColor,
                      fontWeight: FontWeight.w500),
                  children: [
                    TextSpan(
                      text: MoneyUtil.formatAmount('${price ?? 0}'),
                      style: TextStyle(
                          fontSize: 20.sp,
                          color: 11.skColor,
                          fontWeight: FontWeight.w500),
                    )
                  ])),
        );
      } else {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(
                    text: '￥',
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: 11.skColor,
                        fontWeight: FontWeight.w500),
                    children: [
                  TextSpan(
                    text: MoneyUtil.formatAmount('${price ?? 0}'),
                    style: TextStyle(
                        fontSize: 20.sp,
                        color: 11.skColor,
                        fontWeight: FontWeight.w500),
                  )
                ])),
            Text(
              '(剩余${stock ?? 0}份)',
              style: TextStyle(
                  fontSize: 12.w,
                  color: 3.skColor,
                  fontWeight: FontWeight.w400),
            )
          ],
        );
      }
    }
  }
}
