//顶部
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import 'package:nft_flutter/common/extensions/ex_string.dart';
import 'package:nft_flutter/common/extensions/ex_widget.dart';

import '../../../../common/utils/text_util.dart';
import '../../../../common/widgets/image_x.dart';
import '../../brand_details/bean/brand_collection_list_bean.dart';
import '../../brand_details/bean/collection_detail_bean.dart';
import 'collection_header_view.dart';

///藏品头部简介信息view
class CollectionInfoView extends StatelessWidget {
  const CollectionInfoView(
      {super.key,
      this.id,
      this.name,
      this.commodityTypeName,
      this.commodityType,
      this.seriesName,
      this.collectionHash,
      this.quantity,
      this.reserve});

  final String? id;
  final String? name;
  final String? commodityTypeName;
  final String? commodityType;
  final String? seriesName;
  final String? collectionHash;
  final num? quantity;
  final num? reserve;

  num getCirculation() {
    num result = 0;

    num quantitys = quantity ?? 0;
    num reserves = reserve ?? 0;

    result = quantitys - reserves;
    return result;
  }

  @override
  Widget build(BuildContext context) {
    //Transform.translate(
    //         offset: Offset(0, -50.w), // 向上移动 50 像素
    //         child: )
    return Stack(
      children: [
        SizedBox(
          width: double.maxFinite,
          height: 180.w,
        ).frostedGlass(bgColor: 1.skColor.withOpacity(0.5)),
        ImageX(
            type: ImageType.asset, image: 'bg_collection_card.png'.skImagePath),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name ?? '',
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
                    buildTag(key: '限量', value: '${quantity ?? ''}'),
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
                          padding: EdgeInsets.only(right: 10.w, left: 25.w),
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
                            commodityTypeName ?? '',
                            style: TextStyle(color: 2.skColor, fontSize: 10.sp),
                          ),
                        ).clipRRect(all: 21.w),
                      ),
                      buildIcon()
                    ],
                  ),
                )
              ],
            ),
            // SizedBox(
            //   height: 12.w,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //       '藏品编号：',
            //       style: TextStyle(
            //           color: 3.skColor,
            //           fontSize: 14.sp,
            //           fontWeight: FontWeight.w400),
            //     ),
            //     Text(
            //       id ?? '',
            //       style: TextStyle(
            //           color: 1.skColor,
            //           fontSize: 14.sp,
            //           fontWeight: FontWeight.w500),
            //     )
            //   ],
            // ),
            SizedBox(
              height: 10.w,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '所属系列：',
                  style: TextStyle(
                      color: 3.skColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  seriesName ?? '',
                  style: TextStyle(
                      color: 1.skColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
            SizedBox(
              height: 10.w,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '合约地址：',
                  style: TextStyle(
                      color: 3.skColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  TextUtil.maskIDCard(collectionHash),
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                      color: 1.skColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ],
        ).paddingSymmetric(horizontal: 15.w, vertical: 20.w)
      ],
    );
  }

  buildColor() {
    if (commodityType == null || commodityType.isEmptyOrNull) {
      return [Colors.transparent, Colors.transparent];
    } else {
      switch (commodityType) {
        case '1':
          return [16.skColor, 17.skColor];
        case '2':
          return [18.skColor, 0.skColor];
        case '3':
          return [18.skColor, 0.skColor];
      }

      return [18.skColor, 0.skColor];
    }
  }

  buildIcon() {
    if (commodityType == null || commodityType.isEmptyOrNull) {
      return Container();
    } else {
      switch (commodityType) {
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
}
