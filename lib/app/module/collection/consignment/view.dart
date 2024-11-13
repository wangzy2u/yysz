import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nft_flutter/app/module/collection/consignment/item/future_income_view.dart';
import 'package:nft_flutter/app/module/collection/consignment/item/pay_method_view.dart';
import 'package:nft_flutter/app/module/collection/consignment/item/price_info_view.dart';
import 'package:nft_flutter/app/module/collection/consignment/item/price_set_view.dart';
import 'package:nft_flutter/app/module/collection/item/buy_or_sell_instructions.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import 'package:nft_flutter/common/extensions/ex_widget.dart';
import 'package:nft_flutter/common/utils/money_util.dart';
import 'package:nft_flutter/common/widgets/appbar_x.dart';
import 'package:nft_flutter/common/widgets/icon_x.dart';

import '../item/collection_header_view.dart';
import '../item/secondary_collection_info_view.dart';
import 'logic.dart';

/// 寄售详情
class ConsignmentPage extends StatelessWidget {
  ConsignmentPage({Key? key}) : super(key: key);

  final ConsignmentLogic logic = Get.put(ConsignmentLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: 4.skColor,
      body: Stack(
        children: [
          GetBuilder<ConsignmentLogic>(builder: (logic) {
            return SingleChildScrollView(
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
                        collectionSerialNumber: '#${logic.itemBean
                            ?.collectionSerialNumber ?? ''}',
                        name: logic.itemBean?.collectionName,
                        holderBlockChainAddr: logic.itemBean
                            ?.holderBlockChainAddr,
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
                      //设置售价-非生态藏品用
                      if(logic.itemBean?.commodityType != '3')
                      PriceSetView(
                        buyPrice: MoneyUtil.formatAmount(
                            '${logic.itemBean?.buyPrice ?? 0}'),
                        onChanged: logic.onPriceChange,
                      )else
                        PriceInfoView(
                          price: logic.itemBean?.price,
                          latestTransactionPrice: logic.itemBean?.latestTransactionPrice,
                          preventCollectionPrice: logic.itemBean?.preventCollectionPrice,
                          guidingPrice: logic.itemBean?.guidingPrice,
                        ),

                      //收款账户
                      receivingAccount(),
                      SizedBox(
                        height: 16.w,
                      ),
                      GetBuilder<ConsignmentLogic>(
                          id: 'price',
                          builder: (logic) {
                        return FutureIncomeView(
                          totalPrice: logic.sellPrice,
                          transactionRates: logic.transactionRates,
                          rates: logic.rates,
                          income: logic.estimatedIncome,


                        );
                      }),
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
      bottomNavigationBar: GetBuilder<ConsignmentLogic>(builder: (logic) {
        return Container(
          height: 100.w,
          color: 2.skColor,
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.w),
          child: Column(
            children: [

              Container(
                color: 0.skColor,
                height: 44.w,
                width: double.infinity,
                child: Text('确认寄售', style: TextStyle(
                    color: 2.skColor, fontSize: 16.sp, fontWeight: FontWeight
                    .w500),)
                    .center(),
              ).clipRRect(all: 22.w).onTap(() {
                logic.startSell();
              })

            ],
          ),
        );
      }).clipRRect(topRight: 16.w, topLeft: 16.w),
    );
  }

  //收款账户
  receivingAccount() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.w),
      color: 2.skColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '收款账户',
            style: TextStyle(
                color: 1.skColor, fontSize: 18.sp, fontWeight: FontWeight.w500),
          ),
          PayMethodView(
            isOpenEbao: logic.payRegisterStateBean?.yiabaoWalletStatus == 1,
            payMethodsType: null,
            onChanged: (type) {
              logic.payMethodsType = type;
            },
            onOpenTab: () {
              //点击开通易宝钱包
              logic.openEbao();
            },
          ),
        ],
      ),
    ).clipRRect(all: 16.w).marginOnly(left: 15.w, right: 15.w, top: 16.w);
  }
}
