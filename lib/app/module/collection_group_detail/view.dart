import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:keframe/keframe.dart';
import 'package:nft_flutter/app/module/collection/item/collection_header_view.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import 'package:nft_flutter/common/extensions/ex_string.dart';
import 'package:nft_flutter/common/extensions/ex_widget.dart';
import 'package:nft_flutter/common/utils/log_util.dart';

import '../../../common/widgets/appbar_x.dart';
import '../../../common/widgets/icon_x.dart';
import '../../../common/widgets/list/refresh_more_widget.dart';
import '../../data/base_api.dart';
import '../../routes/app_routes.dart';
import 'item/group_collection_info_view.dart';
import 'item/group_order_view.dart';
import 'item/item_pending_orders.dart';
import 'logic.dart';

///藏品聚合详情-挂单页
class CollectionGroupDetailPage extends StatelessWidget
    with RefreshLoadMoreWidget {
  CollectionGroupDetailPage({Key? key}) : super(key: key);

  final CollectionGroupDetailLogic logic =
  Get.put(CollectionGroupDetailLogic(), tag: '$presentCount');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: 4.skColor,
      bottomNavigationBar: Container(
        color: 2.skColor,
        height: 102.w,
        alignment: Alignment.topCenter,
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.w),
        child: InkWell(
          onTap: (){
            logic.fastCreateCollectionOrder();
          },
          child: Container(
            height: 44.w,
            color: 0.skColor,
            alignment: Alignment.center,
            child: Text(
              '快捷下单',
              style: TextStyle(
                  color: 2.skColor, fontSize: 16.sp, fontWeight: FontWeight.w500),
            ),
          ).clipRRect(all: 22.w),
        ),
      ).clipRRect(topRight: 16.w, topLeft: 16.w),
      body: Stack(
        children: [
          GetBuilder<CollectionGroupDetailLogic>(
              tag: '$presentCount',
              builder: (logic) {
                return buildWidget(
                  child: SingleChildScrollView(
                    controller: logic.scrollController,
                    child: Column(
                      children: [
                        CollectionHeaderView(
                          cover: logic.detailBean?.cover,
                          background: logic.detailBean?.cover,
                        ),
                        Stack(
                          children: [
                            GroupCollectionInfoView(
                              itemBean: logic.detailBean,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 84.w,
                                ),
                                // Container(
                                //   child: GroupOrderView(
                                //     detailBean: logic.detailBean,
                                //   ),
                                // ),
                                Obx(() {
                                  return  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          logic.selectPrice();
                                        },
                                        child: Container(

                                          padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 12.w),

                                          child: Row(
                                            children: [
                                              Text(
                                                '按价格排序',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color: 1.skColor,
                                                    fontWeight: FontWeight
                                                        .w400),
                                              ),
                                              Container(
                                                height: 15.w,
                                                alignment: Alignment
                                                    .bottomCenter,
                                                child: IconX.image(
                                                  logic.getPriceIcon(),
                                                  size: 12.w,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),

                                      SizedBox(width: 2.w,),
                                      InkWell(
                                        onTap: () {
                                          logic.selectNum();
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 12.w),
                                          child: Row(
                                            children: [
                                              Text(
                                                '按编号排序',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color: 1.skColor,
                                                    fontWeight: FontWeight
                                                        .w400),
                                              ),
                                              Container(
                                                height: 15.w,
                                                alignment: Alignment
                                                    .bottomCenter,
                                                child: IconX.image(
                                                  logic.getNumIcon(),
                                                  size: 12.w,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                                MediaQuery.removePadding(
                                  context: context,
                                  removeTop: true,
                                  child: ListView.builder(
                                      itemCount: logic.orderList.length,
                                      shrinkWrap: true,
                                      // 自动调整大小
                                      physics:
                                      const NeverScrollableScrollPhysics(),
                                      // 禁用 ListView 自身的滚动
                                      itemBuilder: (context, index) {
                                        return FrameSeparateWidget(
                                          index: index,
                                          child: InkWell(
                                            onTap: () {
                                              Get.toNamed(
                                                  AppRoutes
                                                      .secondaryCollectionDetailPage,
                                                  arguments: {
                                                    'id': logic.orderList[index]
                                                        .id
                                                  });
                                            },
                                            child: ItemPendingOrders(
                                                itemBean:
                                                logic.orderList[index]),
                                          ),
                                        );
                                      }),
                                )
                              ],
                            )
                          ],
                        ).translate(offset: Offset(0, -50.w))
                      ],
                    ),
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
          )
        ],
      ),
    );
  }

  @override
  void onLoading() async {
    var res = await logic.getPendingOrders(pageNum);
    LoggerUtil.e(res);
    didLoadMore(res);
  }

  @override
  void onRefresh() async {
    var res = await logic.getPendingOrders(pageNum);


    didRefresh(res);
  }
}
