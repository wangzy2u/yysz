import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nft_flutter/app/data/all_bindings.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import 'package:nft_flutter/common/extensions/ex_string.dart';
import 'package:nft_flutter/common/extensions/ex_widget.dart';

import '../../../../common/widgets/icon_x.dart';
import '../bean/collection_pending_orders_list_bean.dart';

class ItemPendingOrders extends StatelessWidget {
  const ItemPendingOrders({super.key, required this.itemBean});

  final PendingOrderItemBean itemBean;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: 2.skColor,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 18.w,
                    alignment: Alignment.center,
                    child: Text(

                      itemBean.collectionName ?? '',
                      style: TextStyle(
                        height: 0.6,
                          color: 1.skColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(width: 12.w,),

                  Container(
                    height: 18.w,
                    color: 20.skColor,
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    alignment: Alignment.center,
                    child: Text(
                    '编号：${itemBean.collectionSerialNumber ?? ''}/${itemBean.quantity}',
                      style: TextStyle(
                          color: 9.skColor,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400),
                    ),
                  ).clipRRect(all: 4.w)
                ],
              ),

              SizedBox(height: 12.w,),

              Row(
                children: [
                  buildTag('寄售', 19.skColor.withOpacity(0.1), 19.skColor),

                  if(itemBean.payWay == 1)
                    buildTag('连连', 21.skColor.withOpacity(0.1), 21.skColor),

                  if(itemBean.payWay == 2)
                    buildTag('易宝', 0.skColor.withOpacity(0.1), 0.skColor),

                  if(itemBean.lockPayMemberId.isNotEmptyOrNull)
                    buildTag('锁单', 11.skColor.withOpacity(0.1), 11.skColor),
                ],
              )

            ],
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 2.w),
                child: Text(
                  '￥${itemBean.resalePrice ?? ''}',
                  style: TextStyle(
                      color: 1.skColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500),
                ),
              ),
              IconX.icon(
                Icons.arrow_forward_ios,
                color: 1.skColor,
                size: 15.w,
              )
            ],
          )
        ],
      ),
    ).clipRRect(all: 16.w).margin(left: 15.w,right: 15.w,bottom: 12.w);
  }


  buildTag(String title,Color bgColor,Color lineColor){
    return Container(

      color: bgColor,
      height: 16.sp,
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: Text(title,style: TextStyle(color: lineColor,fontSize: 10.sp,fontWeight: FontWeight.w400),),

    ).clipRRect(all: 4.w).border(all: 1.w,radius: 4.w,color: lineColor).margin(right: 8.w);
  }



}
