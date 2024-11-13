

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import 'package:nft_flutter/common/extensions/ex_widget.dart';
import 'package:nft_flutter/common/widgets/banner_widget.dart';

import '../../../../common/widgets/image_x.dart';
import '../bean/collection_detail_bean.dart';

///品牌-藏品列表item
class ItemBrandCollection extends StatelessWidget {
  final CollectionDetailBean itemBean;
  const ItemBrandCollection({super.key, required this.itemBean});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 164.w,
          child: Stack(
            children: [
              // CachedNetworkImage(imageUrl: itemBean.cover ?? '')

              // CachedNetworkImage(imageUrl: itemBean.cover ?? '',),
              ImageX.url(
                itemBean.cover ?? '',
                height: 360.w,
                width: double.maxFinite,
                fit: BoxFit.cover,
                radius: 16.w,
              ),

              Positioned(
                  left: 10.w,
                  top: 12.w,
                  child: buildTag())

            ],
          ),
        ),
        Text(
          '${itemBean.name}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: 14.sp,
              color: 1.skColor,
              fontWeight: FontWeight.w600),
        ).marginOnly(left:12.w,top: 12.w),


        RichText(
            text: TextSpan(
          text: '￥',
          style: TextStyle(color: 11.skColor,fontSize: 10.sp),
          children: [
            TextSpan(
                text: '${itemBean.price}',
                style: TextStyle(color: 11.skColor,fontSize: 16.sp),

            )
          ]
        )).marginOnly(bottom: 12.w,left: 12.w,top: 4.w)

      ],
    ).backgroundColor(2.skColor)
        .clipRRect(all: 16.w);
  }


  buildTag(){
    return Container(
      padding: EdgeInsets.only(left: 5.w),
      height: 20.w,
      width: 84.w,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [12.skColor, 13.skColor], // 渐变的颜色数组
          begin: Alignment.centerLeft, // 渐变开始的方向
          end: Alignment.centerRight, // 渐变结束的方向
        ),
      ),
      child: Stack(
        children: [

          Container(
            alignment: Alignment.centerLeft,
              child: Text('限量',style: TextStyle(color: 2.skColor,fontSize: 12.sp),)),


          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: 48.w,
              alignment: Alignment.center,
              color: 14.skColor,
              child: Text('${itemBean.quantity}份',style: TextStyle(color: 0.skColor,fontSize: 12.sp),),
            ).clipRRect(topLeft:6.w,bottomLeft: 0),
          )

        ],
      ),
    ).clipRRect(all: 6.w);
  }

}
