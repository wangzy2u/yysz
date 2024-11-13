import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nft_flutter/common/extensions/ex_string.dart';
import 'package:nft_flutter/common/extensions/ex_widget.dart';
import 'package:nft_flutter/common/index.dart';
import 'package:nft_flutter/common/widgets/image_x.dart';

import '../../../../common/utils/date_util.dart';
import '../bean/first_release_list_bean.dart';

class ItemFirstRelease extends StatelessWidget {
  final FirstReleaseItemBean itemBean;

  const ItemFirstRelease({super.key, required this.itemBean});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                height: 345.w,
                child: Stack(
                  children: [
                    // CachedNetworkImage(imageUrl: itemBean.cover ?? '')
                    ImageX.url(
                      itemBean.cover ?? '',
                      height: 345.w,
                      width: double.maxFinite,
                      fit: BoxFit.cover,
                      radius: 16.w,
                    ),
                  ],
                ),
              ),
              buildTips(),


              priority ().visibility(visible: itemBean.preSaleFlag ?? false)
            ],
          ),
          SizedBox(
            height: 12.w,
          ),
          Text(
            itemBean.name ?? '',
            style: TextStyle(
                fontSize: 18.w, color: 1.skColor, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 4.w,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 20.w,
                    color: 4.skColor,
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '系列：',
                          style: TextStyle(
                              fontSize: 10.sp,
                              color: 9.skColor,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          itemBean.seriesName ?? '',
                          style: TextStyle(
                              fontSize: 10.sp,
                              color: 9.skColor,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ).clipRRect(all: 4.w),
                  SizedBox(
                    width: 12.w,
                  ),
                  Container(
                    height: 20.w,
                    color: 4.skColor,
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '限量：',
                          style: TextStyle(
                              fontSize: 10.sp,
                              color: 9.skColor,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          '${itemBean.quantity}份',
                          style: TextStyle(
                              fontSize: 10.sp,
                              color: 9.skColor,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ).clipRRect(all: 4.w)
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
                          itemBean.commodityTypeName ?? '',
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
          SizedBox(
            height: 12.w,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ImageX(
                    type: ImageType.network,
                    image: itemBean.issuerLogo ?? '',
                    width: 28.w,
                    height: 28.w,
                    radius: 14.w,
                  ).border(
                    backgroundColor: 10.skColor,
                    color: 10.skColor,
                    radius: 14.w,
                    // backgroundColor: 10.skColor
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    '${itemBean.issuerName}',
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: 1.skColor,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Text(
                '￥${itemBean.price}',
                style: TextStyle(
                    fontSize: 20.sp,
                    color: 1.skColor,
                    fontWeight: FontWeight.w500),
              ),
            ],
          )
        ],
      ),
    ).marginOnly(bottom: 23.w).backgroundColor(2.skColor);
  }

  buildTips() {
    if (itemBean.stock == null || itemBean.stock! <= 0) {
      return Container(
        height: 28.w,
        color: 2.skColor.withOpacity(0.6),
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 4.w,
              width: 4.w,
              color: 3.skColor,
            ).clipRRect(all: 2.w),
            SizedBox(
              width: 6.w,
            ),
            Text(
              '已售罄',
              style: TextStyle(
                  fontSize: 12.w,
                  color: 1.skColor,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ).clipRRect(all: 14.w).marginAll(12.w);
    }

    int temp = DateUtil.getDateMsByTimeStr(itemBean.saleTime ?? '') ?? 0;

    if (DateUtil.getNowDateMs() < temp) {
      return Container(
        height: 28.w,
        color: 2.skColor.withOpacity(0.6),
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ImageX(
              type: ImageType.asset,
              image: 'icon_alarm_clock.png'.skImagePath,
              height: 14.w,
              width: 14.w,
            ),
            SizedBox(
              width: 6.w,
            ),
            Text(
              '${DateUtil.formatDateStr(itemBean.saleTime ?? '', format: DateFormats.mo_d_h_m)}发售',
              style: TextStyle(
                  fontSize: 12.w,
                  color: 1.skColor,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ).clipRRect(all: 14.w).marginAll(12.w);
    } else {
      return Container(
        height: 28.w,
        color: 2.skColor.withOpacity(0.6),
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 4.w,
              width: 4.w,
              color: 11.skColor,
            ).clipRRect(all: 2.w),
            SizedBox(
              width: 6.w,
            ),
            Text(
              '抢购中',
              style: TextStyle(
                  fontSize: 12.w,
                  color: 1.skColor,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ).clipRRect(all: 14.w).marginAll(12.w);
    }
  }

  buildColor() {
    if (itemBean.commodityType == null ||
        itemBean.commodityType.isEmptyOrNull) {
      return [Colors.transparent, Colors.transparent];
    } else {
      switch (itemBean.commodityType) {
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
    if (itemBean.commodityType == null ||
        itemBean.commodityType.isEmptyOrNull) {
      return Container();
    } else {
      switch (itemBean.commodityType) {
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


  Widget priority (){
    return Container(
      color: 1.skColor,
      height: 28.w,
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Row(
        children: [
          ImageX(type: ImageType.asset, image: 'icon_lightning.png'.skImagePath,height: 14.w,),
          SizedBox(width: 5.w,),
          Text(
            '优先购',
            style: TextStyle(
                fontSize: 12.sp,
                color: 30.skColor,
                fontWeight: FontWeight.w500),
          )
        ],
      ),

    ).clipRRect(all: 8.w).margin(top: 12.w,right: 16.w).positioned(right: 0);
  }

}
