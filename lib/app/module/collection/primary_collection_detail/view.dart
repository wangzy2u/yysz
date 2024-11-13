import 'dart:math';

import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nft_flutter/app/data/base_api.dart';
import 'package:nft_flutter/app/module/collection/item/asset_info_view.dart';
import 'package:nft_flutter/app/module/collection/item/collection_buy_view.dart';
import 'package:nft_flutter/app/module/collection/item/collection_header_view.dart';
import 'package:nft_flutter/app/module/collection/item/collection_info_view.dart';
import 'package:nft_flutter/app/module/collection/item/creator_item_view.dart';
import 'package:nft_flutter/app/module/collection/item/issuer_item_view.dart';
import 'package:nft_flutter/app/module/collection/item/works_story_view.dart';
import 'package:nft_flutter/app/routes/app_routes.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import 'package:nft_flutter/common/extensions/ex_string.dart';
import 'package:nft_flutter/common/extensions/ex_widget.dart';
import 'package:nft_flutter/common/widgets/appbar_x.dart';
import 'package:nft_flutter/common/widgets/icon_x.dart';
import 'package:nft_flutter/common/widgets/list/refresh_widget.dart';

import '../item/buy_num_dialog.dart';
import '../item/buy_or_sell_instructions.dart';
import 'logic.dart';

///一级市场 - 藏品详情
class PrimaryCollectionDetailPage extends StatelessWidget with RefreshWidget {
  PrimaryCollectionDetailPage({Key? key}) : super(key: key);

  final PrimaryCollectionDetailLogic logic =
      Get.put(PrimaryCollectionDetailLogic(), tag: '$presentCount');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: 4.skColor,
      bottomNavigationBar: GetBuilder<PrimaryCollectionDetailLogic>(
          tag: '$presentCount',
          builder: (logic) {
            return CollectionBuyView(
              saleTime: logic.itemBean?.saleTime,
              stock: logic.itemBean?.stock,
              price: logic.itemBean?.price,
              onBuyPressed: () async {
                String result = await Get.bottomSheet(BuyNumDialog(
                  maxNum: (logic.itemBean?.stock ?? 1).toInt(),
                ));

                if (result.isNotEmptyOrNull) {
                  logic.createCollectionOrder(result);
                }
              },
            );
          }),
      body: Stack(
        children: [
          GetBuilder<PrimaryCollectionDetailLogic>(
              tag: '$presentCount',
              builder: (logic) {
                return EasyRefresh.builder(
                  header: const MaterialHeader(
                    clamping: true,
                  ),
                  onRefresh: () async {
                    logic.getCollectionDetails();
                    // ....
                  },
                  childBuilder: (context, ph) {
                    return SingleChildScrollView(
                      physics: ph,
                      controller: logic.scrollController,
                      child: Column(
                        children: [
                          CollectionHeaderView(
                            cover: logic.itemBean?.cover,
                            background: logic.itemBean?.background,
                          ),
                          Column(
                            children: [
                              CollectionInfoView(
                                id: logic.itemBean?.id,
                                name: logic.itemBean?.name,
                                collectionHash: logic.itemBean?.collectionHash,
                                commodityType: logic.itemBean?.commodityType,
                                commodityTypeName: logic.itemBean?.coverDisplayTypeName,
                                seriesName: logic.itemBean?.seriesName,
                                quantity: logic.itemBean?.quantity,
                                reserve: logic.itemBean?.reserve,
                              ),
                              // SizedBox(
                              //   height: 20.w,
                              // ),
                              IssuerItemView(
                                title: '发行方',
                                subTitle: logic.itemBean?.issuerName,
                                imgUrl: logic.itemBean?.issuerLogo,
                              ).onTap(() {
                                Get.toNamed(AppRoutes.brandDetailsPage,
                                    arguments: {
                                      'id': logic.itemBean?.issuerId,
                                    });
                              }),
                              SizedBox(
                                height: 16.w,
                              ),
                              CreatorItemView(
                                  title: '创作者',
                                  desc: logic.itemBean?.issuerIntroduce),

                              if(logic.itemBean?.commodityType == '3')
                              SizedBox(
                                height: 16.w,
                              ),
                              if(logic.itemBean?.commodityType == '3')
                              AssetInfoView(
                                  price: logic.itemBean?.price,
                                  dailyIncrease: logic.itemBean?.dailyIncrease,
                                  incubationPeriod: logic.itemBean?.incubationPeriod,
                                  incubationLimit:
                                      logic.itemBean?.incubationLimit,
                              saleRule: logic.itemBean?.saleRule,
                              ),
                              SizedBox(
                                height: 16.w,
                              ),
                              WorksStoryView(
                                collectionStorys:
                                    logic.storyLink,
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
                    );
                  },
                );
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
          )
        ],
      ),
    );
  }

  @override
  void onRefresh() async {
    logic.getCollectionDetails();

    didRefresh(true);
  }
}
