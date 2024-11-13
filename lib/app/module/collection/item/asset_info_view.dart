

import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:nft_flutter/app/widgets/line_widget.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import 'package:nft_flutter/common/extensions/ex_widget.dart';
import 'package:nft_flutter/common/utils/num_util.dart';

import '../../brand_details/bean/brand_collection_list_bean.dart';
import '../../brand_details/bean/collection_detail_bean.dart';

class AssetInfoView extends StatelessWidget {
  const AssetInfoView({super.key, this.price, this.dailyIncrease, this.incubationPeriod, this.incubationLimit, this.saleRule,});

  final num? price;
  final num? dailyIncrease;
  final num? incubationPeriod;
  final num? incubationLimit;
  final String? saleRule;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      color: 2.skColor,
      padding: EdgeInsets.all(12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '资产信息',
            style: TextStyle(
                fontSize: 18.sp,
                color: 1.skColor,
                fontWeight: FontWeight.w500),
          ),


          SizedBox(height: 12.w,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '发行价格：',
                style: TextStyle(
                    color: 3.skColor, fontSize: 14.sp,fontWeight: FontWeight.w400),
              ),

              Text(
                '￥${price}',
                style: TextStyle(
                    color: 1.skColor, fontSize: 14.sp,fontWeight: FontWeight.w500),
              )
            ],
          ),

          SizedBox(height: 10.w,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '指导价格：',
                style: TextStyle(
                    color: 3.skColor, fontSize: 14.sp,fontWeight: FontWeight.w400),
              ),

              Text(
                '${NumUtil.multiply(dailyIncrease ?? 0, 100)}%/天',
                style: TextStyle(
                    color: 1.skColor, fontSize: 14.sp,fontWeight: FontWeight.w500),
              )
            ],
          ),

          SizedBox(height: 10.w,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '孵化周期：',
                style: TextStyle(
                    color: 3.skColor, fontSize: 14.sp,fontWeight: FontWeight.w400),
              ),

              Text(
                '${incubationPeriod ?? 0}天',
                style: TextStyle(
                    color: 1.skColor, fontSize: 14.sp,fontWeight: FontWeight.w500),
              )
            ],
          ),


          SizedBox(height: 10.w,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '孵化上限：',
                style: TextStyle(
                    color: 3.skColor, fontSize: 14.sp,fontWeight: FontWeight.w400),
              ),

              Text(
                '${incubationLimit ?? ''}份',
                style: TextStyle(
                    color: 1.skColor, fontSize: 14.sp,fontWeight: FontWeight.w500),
              )
            ],
          ),

          SizedBox(height: 16.w,),
          horizontalLine(),
          SizedBox(height: 16.w,),

          Text(
            '孵化规则',
            style: TextStyle(
                fontSize: 14.sp,
                color: 1.skColor,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 12.w,),
          Text(
            saleRule ?? '',
            style: TextStyle(
                color: 3.skColor, fontSize: 14.sp,fontWeight: FontWeight.w400),
          ),


        ],
      ),
    ).clipRRect(all: 16.w).marginSymmetric(horizontal: 15.w);
  }
}
