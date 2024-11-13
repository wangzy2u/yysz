import 'package:flutter/widgets.dart';
import 'package:nft_flutter/app/module/hall/bean/secondary_market_collection_list.dart';
import 'package:nft_flutter/common/index.dart';

import '../../../../common/widgets/image_x.dart';

/// 大厅-资产列表
class ItemAssetsView extends StatelessWidget {
  final SecondaryMarketCollectionBean itemBean;
  const ItemAssetsView({super.key, required this.itemBean});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 164.w,
            child: Stack(
              children: [
                // CachedNetworkImage(imageUrl: itemBean.cover ?? '')

                // CachedNetworkImage(imageUrl: itemBean.cover ?? '',),
                ImageX.url(
                  itemBean.collectionCover ?? '',
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
            '${itemBean.collectionName}',
            style: TextStyle(
                fontSize: 14.sp,
                color: 1.skColor,
                fontWeight: FontWeight.w400),
          ).marginOnly(left:12.w,top: 12.w),


          SizedBox(height: 4.w,),
          Container(
            height: 20.w,
            color: 4.skColor,
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '流通：',
                  style: TextStyle(
                      fontSize: 10.sp,
                      color: 9.skColor,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  '${itemBean.availableNum}份',
                  style: TextStyle(
                      fontSize: 10.sp,
                      color: 9.skColor,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ).clipRRect(all: 4.w).margin(horizontal: 12.w),

          RichText(
              text: TextSpan(
                  text: '￥',
                  style: TextStyle(color: 11.skColor,fontSize: 16.sp,fontWeight: FontWeight.w500),
                  children: [
                    TextSpan(
                      text: '${itemBean.minPrice} 起',
                      style: TextStyle(color: 11.skColor,fontSize: 16.sp,fontWeight: FontWeight.w500),

                    )
                  ]
              )).marginOnly(bottom: 1.w,left: 12.w,top: 4.w)
        ],
      ),
    ).backgroundColor(2.skColor)
        .clipRRect(all: 16.w);
  }



  buildTag(){
    return Container(
      height: 20.w,
      width: 56.w,
      color: 1.skColor,
      child: Container(
          alignment: Alignment.center,
          child: Text('挂单 ${itemBean.orderCount}',style: TextStyle(color: 2.skColor,fontSize: 12.sp,fontWeight: FontWeight.w400),)),
    ).clipRRect(all: 13.w);
  }
}
