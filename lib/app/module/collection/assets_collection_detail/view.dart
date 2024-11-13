import 'dart:math';

import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nft_flutter/app/data/all_bindings.dart';
import 'package:nft_flutter/app/routes/app_routes.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import 'package:nft_flutter/common/extensions/ex_string.dart';
import 'package:nft_flutter/common/extensions/ex_widget.dart';
import 'package:nft_flutter/common/widgets/appbar_x.dart';
import 'package:nft_flutter/common/widgets/icon_x.dart';

import '../../../../common/utils/money_util.dart';
import '../../../../common/widgets/list/refresh_widget.dart';
import '../item/asset_info_view.dart';
import '../item/buy_or_sell_instructions.dart';
import '../item/collection_header_view.dart';
import '../item/creator_item_view.dart';
import '../item/secondary_collection_info_view.dart';
import '../item/works_story_view.dart';
import 'logic.dart';

///资产详情页面
class AssetsCollectionDetailPage extends StatelessWidget with RefreshWidget {
  AssetsCollectionDetailPage({Key? key}) : super(key: key);

  final AssetsCollectionDetailLogic logic = Get.put(
      AssetsCollectionDetailLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: 4.skColor,
      body: Stack(
        children: [
          GetBuilder<AssetsCollectionDetailLogic>(
              builder: (logic) {
                return buildWidget(child: SingleChildScrollView(
                  controller: logic.scrollController,
                  child: Column(
                    children: [
                      CollectionHeaderView(
                        cover: logic.itemBean?.collectionCover,
                        background: logic.itemBean?.collectionCover,
                      ),
                      Column(
                        children: [
                          SecondaryCollectionInfoView(
                            collectionSerialNumber: '#${logic.itemBean?.collectionSerialNumber}',
                            name: logic.itemBean?.collectionName,
                            holderBlockChainAddr: logic.itemBean?.holderBlockChainAddr,
                            commodityType: logic.itemBean?.commodityType,
                            // commodityTypeName:
                            //     logic.itemBean?.coverDisplayTypeName,
                            seriesName: logic.itemBean?.seriesName,
                            quantity: logic.itemBean?.quantity,
                            // reserve: logic.itemBean?.reserve,
                          ),
                          SizedBox(
                            height: 20.w,
                          ),
                          // IssuerItemView(
                          //   title: '发行方',
                          //   subTitle: logic.itemBean?.creatorName,
                          //   imgUrl: logic.itemBean?.creatorLogo,
                          // ).onTap(() {
                          //   Get.toNamed(AppRoutes.brandDetailsPage,
                          //       arguments: {
                          //         'id': logic.itemBean?.issuerId,
                          //       });
                          // }),
                          // SizedBox(
                          //   height: 16.w,
                          // ),
                          CreatorItemView(
                              title: '创作者',
                              desc: logic.itemBean?.creatorName),
                          if(logic.itemBean?.commodityType == '3')
                            SizedBox(
                              height: 16.w,
                            ),
                          if(logic.itemBean?.commodityType == '3')
                            AssetInfoView(
                              price: logic.itemBean?.price ?? logic.itemBean?.collectionStartPrice,
                              dailyIncrease: logic.itemBean?.dailyIncrease ?? logic.itemBean?.collectionDailyIncrease,
                              incubationPeriod: logic.itemBean?.incubationPeriod,
                              incubationLimit:
                              logic.itemBean?.incubationLimit ?? logic.itemBean?.collectionIncubationLimit,
                              saleRule: logic.itemBean?.saleRule ?? logic.itemBean?.collectionSaleRule,
                            ),
                          SizedBox(
                            height: 16.w,
                          ),
                          WorksStoryView(
                            collectionStorys:
                            logic.itemBean?.storyPicLinks,
                          ),

                          SizedBox(
                            height: 16.w,
                          ),
                          BuyOrSellInstructions(
                            title: logic.dictItemBean?.dictItemRemark ?? '寄售须知',
                            content: logic.dictItemBean?.dictItemName ?? '',
                          )
                        ],
                      ).translate(offset: Offset(0, -50.w))
                    ],
                  ),
                ));
              }),
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            child: Obx(() {
              return buildAppbar(
                  bgColor: 2.skColor.withOpacity(logic.appBarOpacity.value),
                  iconLeft: IconX.icon(
                    Icons.arrow_back_ios_new,
                    color:
                    logic.appBarOpacity.value == 1 ? 1.skColor : 2.skColor,
                    size: 20.w,
                  ));
            }),
          ),


        ],
      ),
      bottomNavigationBar: GetBuilder<AssetsCollectionDetailLogic>(builder: (logic) {
        return Container(
          height: 100.w,
          color: 2.skColor,
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.w),
          child: Column(
            children: [

              buildBottomBar()

            ],
          ),
        );
      }).clipRRect(topRight: 16.w, topLeft: 16.w),
    );
  }


  buildBottomBar() {
    if (logic.resaleId.isNotEmpty) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: RichText(
                text: TextSpan(
                    text: '￥',
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: 11.skColor,
                        fontWeight: FontWeight.w500),
                    children: [
                      TextSpan(
                        text: MoneyUtil.formatAmount(
                            '${logic.itemBean?.resalePrice ?? 0}'),
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: 11.skColor,
                            fontWeight: FontWeight.w500),
                      )
                    ])),
          ),

          Container(
            child: Container(
              color: 0.skColor,
              height: 44.w,
              width: 188.w,
              child: Text('取消寄售', style: TextStyle(color: 2.skColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500),).center(),
            ).clipRRect(all: 22.w).onTap(() {


              logic.cancelConsignment();
            }),
          ),

        ],
      );
    } else {
     return Container(
        color: 0.skColor,
        height: 44.w,
        width: double.infinity,
        child: Text('立即寄售', style: TextStyle(
            color: 2.skColor, fontSize: 16.sp, fontWeight: FontWeight.w500),)
            .center(),
      ).clipRRect(all: 22.w).onTap(() {
        Get.toNamed(
            AppRoutes.consignmentPage, arguments: {'id': logic.itemBean?.id})?.then((result){
              print('返回来来了来了 --------$result');

              if(result != null && result.toString().isNotEmptyOrNull){
                logic.resaleId = result;
                logic.getCollectionDetails();
              }
        });
      });
    }
  }

  @override
  void onRefresh() {
    logic.getCollectionDetails();

    didRefresh(true);
  }
}
