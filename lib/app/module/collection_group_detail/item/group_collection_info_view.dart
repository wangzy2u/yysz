

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import 'package:nft_flutter/common/extensions/ex_string.dart';
import 'package:nft_flutter/common/extensions/ex_widget.dart';

import '../../../../common/widgets/image_x.dart';
import '../../brand_details/bean/collection_detail_bean.dart';

class GroupCollectionInfoView extends StatelessWidget {
  const GroupCollectionInfoView({super.key, this.itemBean});
  final CollectionDetailBean ? itemBean;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        SizedBox(
          width: double.maxFinite,
          height: 180.w,
        ).frostedGlass(bgColor: 1.skColor.withOpacity(0.5)),
        ImageX(
            type: ImageType.asset,
            image: 'bg_collection_card.png'.skImagePath),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              itemBean?.name ?? '',
              style: TextStyle(
                  fontSize: 18.sp,
                  color: 1.skColor,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 12.w,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    buildTag(
                        key: '限量', value: '${itemBean?.quantity ?? ''}'),
                    SizedBox(
                      width: 12.w,
                    ),
                    buildTag(key: '流通', value: '${getCirculation()}')
                  ],
                ),
                Container(
                  height: 24.w,
                  alignment: Alignment.centerLeft,
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Positioned(
                        child: Container(
                          margin: EdgeInsets.only(left: 3.w),
                          padding: EdgeInsets.only(right: 10.w,left: 25.w),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: buildColor(), // 渐变的颜色数组
                              begin: Alignment.centerLeft, // 渐变开始的方向
                              end: Alignment.centerRight, // 渐变结束的方向
                            ),
                          ),
                          alignment: Alignment.centerRight,
                          height: 18.w,
                          child: Text(
                            itemBean?.commodityTypeName ?? '',
                            style: TextStyle(
                                color: 2.skColor, fontSize: 10.sp),
                          ),
                        ).clipRRect(all: 21.w),
                      ),
                      buildIcon()

                    ],
                  ),
                )
              ],
            ),

          ],
        ).paddingSymmetric(horizontal: 15.w, vertical: 20.w)
      ],
    );
  }
  num getCirculation(){
    num result = 0;

    if(itemBean != null){
      num quantity =  itemBean?.quantity ?? 0;
      num reserve =  itemBean!?.reserve ?? 0;

      result = quantity - reserve;
    }
    return result;
  }

  buildColor(){
    if(itemBean == null || itemBean!.commodityType.isEmptyOrNull){
      return [Colors.transparent, Colors.transparent];
    }else{
      switch(itemBean?.commodityType){
        case '1':
          return [16.skColor, 17.skColor];
        case '2':
          return [18.skColor, 0.skColor];
        case '3':
          return [18.skColor, 0.skColor];
      }

      return  [18.skColor, 0.skColor];
    }
  }

  buildIcon(){
    if(itemBean == null || itemBean!.commodityType.isEmptyOrNull){
      return Container();
    }else{
      switch(itemBean?.commodityType){
        case '1':

          return ImageX.asset(
            'icon_yellow_star.png'.skImagePath,
            height: 23.w,
            width: 23.w,
          );
        case '2':
          return ImageX.asset(
            'icon_blue_star.png'.skImagePath,
            height: 23.w,
            width: 23.w,
          );
        case '3':
          return ImageX.asset(
            'icon_blue_star.png'.skImagePath,
            height: 23.w,
            width: 23.w,
          );
      }

      return ImageX.asset(
        'icon_blue_star.png'.skImagePath,
        height: 23.w,
        width: 23.w,
      );
    }
  }

  //标签
  buildTag({String? key, String? value}) {
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
              child: Text(
                key ?? '',
                style: TextStyle(color: 2.skColor, fontSize: 12.sp),
              )),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: 48.w,
              alignment: Alignment.center,
              color: 14.skColor,
              child: Text(
                '$value份',
                style: TextStyle(color: 0.skColor, fontSize: 12.sp),
              ),
            ).clipRRect(topLeft: 6.w, bottomLeft: 0),
          )
        ],
      ),
    ).clipRRect(all: 6.w);
  }
}
