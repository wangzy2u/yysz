//
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nft_flutter/app/data/all_bindings.dart';
import 'package:nft_flutter/app/module/digital_identity/bean/member_card_list_bean.dart';
import 'package:nft_flutter/app/widgets/empty_view.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import 'package:nft_flutter/common/extensions/ex_string.dart';
import 'package:nft_flutter/common/extensions/ex_widget.dart';
import 'package:nft_flutter/common/widgets/image_x.dart';

import '../../../../common/utils/text_util.dart';
import 'item_card_view.dart';

class ItemMemberCardView extends StatelessWidget {
  const ItemMemberCardView({super.key, this.memberCardListBean});

  final MemberCardListBean? memberCardListBean;

  @override
  Widget build(BuildContext context) {
    if(memberCardListBean == null || memberCardListBean!.myMemberCardVOList == null){
      return Column(
        children: [
          SizedBox(
            height: 12.w,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            width: double.infinity,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  color: 2.skColor.withOpacity(0.65),
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '权益介绍',
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: 1.skColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      SizedBox(
                        height: 20.w,
                      ),

                      EmptyView(
                        title: '暂未开放',
                        minHeight: 0.5.sw,
                      ),


                    ],
                  ),
                ).clipRRect(all: 16.w).padding(all: 1.w).border(all: 1.w,radius: 17.w,color: 2.skColor).margin(top: 31.w),
                Container(
                  alignment: Alignment.centerRight,
                  child: ImageX.asset(
                    'icon_diamond.png'.skImagePath,
                    width: 128.w,
                    height: 113.w,
                  ),
                ).positioned(top: 0, right: 12.w)
              ],
            ),
          ),


          SizedBox(
            height: 20.w,
          ),
          Container(
            height: 44.w,
            width: double.infinity,
            color: 2.skColor,
            child: Text(
              '暂未开放',
              style: TextStyle(
                fontSize: 14.sp,
                color: 3.skColor,
                fontWeight: FontWeight.w500,
              ),
            ).center(),

          ).clipRRect(all: 8.w).margin(horizontal: 15.w)
        ],
      );
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 12.w,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            width: double.infinity,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  color: 2.skColor.withOpacity(0.65),
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '权益介绍',
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: 1.skColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
      
                      SizedBox(
                        height: 20.w,
                      ),
      
                      Container(
                        alignment:( memberCardListBean?.myMemberCardVOList?.length ?? 0) > 2 ? Alignment.center : Alignment.centerLeft,
                        child: Wrap(
                          alignment: WrapAlignment.start,
                          runAlignment: WrapAlignment.center,
                          spacing: 16.w,
                          children: List.generate(
                              memberCardListBean?.myMemberCardVOList?.length ?? 0,
                              (index) {
                            MyMemberCardVoBean? bean =
                                memberCardListBean?.myMemberCardVOList?[index];
                            return ItemCardView(
                              title: bean?.name ?? '',
                              subTitle: bean?.describe ?? '',
                              image: bean?.icon ?? '',
                            ).constrained(minWidth: 90.w);
                          }).toList(),
                        ),
                      )
                    ],
                  ),
                ).clipRRect(all: 16.w).padding(all: 1.w).border(all: 1.w,radius: 17.w,color: 2.skColor).margin(top: 31.w),
                Container(
                  alignment: Alignment.centerRight,
                  child: ImageX.asset(
                    'icon_diamond.png'.skImagePath,
                    fit: BoxFit.cover,
                    width: 128.w,
                    height: 113.w,
                  ),
                ).positioned(top: 0, right: 12.w)
              ],
            ),
          ),
      
      
          Container(
            width: double.infinity,
            color: 2.skColor.withOpacity(0.65),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '申请条件',
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: 1.skColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
      
                SizedBox(
                  height: 12.w,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '持有资产',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: 1.skColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),


                    Text(
                      '${memberCardListBean?.collectionNum ?? 0}/1',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: 1.skColor,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                )
      
              ],
            ),
          ).clipRRect(all: 16.w).padding(all: 1.w).border(all: 1.w,radius: 17.w,color: 2.skColor).margin(top: 21.w,left: 15.w,right: 15.w),

          SizedBox(
            height: 20.w,
          ),
          InkWell(
            child: Container(
              height: 44.w,
              width: double.infinity,
              color:memberCardListBean?.activeStatus == 1 ? 0.skColor.withOpacity(0.12) : 0.skColor,
              child: Text(
                memberCardListBean?.activeStatus == 1 ? '已加入' : '前往购买',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: memberCardListBean?.activeStatus == 1 ? 0.skColor : 2.skColor,
                  fontWeight: FontWeight.w500,
                ),
              ).center(),
            
            ).clipRRect(all: 8.w).margin(horizontal: 15.w),
          )
        ],
      ),
    );
  }
}
