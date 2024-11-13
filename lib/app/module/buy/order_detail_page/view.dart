import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nft_flutter/app/data/all_bindings.dart';
import 'package:nft_flutter/app/data/common_const.dart';
import 'package:nft_flutter/app/data/global_service.dart';
import 'package:nft_flutter/app/event/main_tab_event.dart';
import 'package:nft_flutter/app/routes/app_routes.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import 'package:nft_flutter/common/extensions/ex_string.dart';
import 'package:nft_flutter/common/extensions/ex_widget.dart';
import 'package:nft_flutter/common/utils/copy_util.dart';
import 'package:nft_flutter/common/utils/toast_util.dart';
import 'package:nft_flutter/common/widgets/appbar_x.dart';
import 'package:nft_flutter/common/widgets/image_x.dart';
import 'package:nft_flutter/common/widgets/tag/tag_item.dart';

import 'item/order_appbar.dart';
import 'logic.dart';

///订单详情
class OrderDetailPage extends StatelessWidget {
  OrderDetailPage({Key? key}) : super(key: key);

  final OrderDetailLogic logic = Get.put(OrderDetailLogic());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderDetailLogic>(builder: (logic) {
      return Scaffold(

        backgroundColor: 4.skColor,
        // appBar: OrderAppbar(),
        appBar: buildAppbar(
            bgColor: 4.skColor,
            title: logic.orderBean?.stateName ?? ''
        ),


        bottomNavigationBar: buildWaitingPay(),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GetBuilder<OrderDetailLogic>(
                    builder: (logic) {
                  return Center(
                    child: Text(
                      logic.time,
                      style: TextStyle(color: 11.skColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  );
                }),

                SizedBox(height: 18.w,),

                Container(
                  color: 2.skColor,

                  padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 12.w),
                  child: Row(
                    children: [

                      ImageX.url(logic.orderBean?.collectionCover ?? '',width: 80.w,height: 80.w,radius: 8.w,fit: BoxFit.cover,),

                      SizedBox(width: 12.w,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            logic.orderBean?.collectionName ?? '',
                            style: TextStyle(color: 1.skColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(height: 5.w,),
                          Text(
                              '数量：${logic.orderBean?.collectNumber ?? ''}',
                            style: TextStyle(color: 3.skColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(height: 8.w,),
                          Text(
                              '￥${logic.orderBean?.amount.toString().toMoney() ?? ''}',
                            style: TextStyle(color: 1.skColor,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      )

                    ],
                  ),

                ).clipRRect(all: 16.w),


                SizedBox(height: 16.w,),

                Container(
                  color: 2.skColor,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 12.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '订单详情',
                        style: TextStyle(color: 1.skColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ),

                      SizedBox(height: 12.w,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '订单金额:',
                            style: TextStyle(color: 3.skColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400),
                          ),


                          Text(
                            '￥${logic.orderBean?.amount.toString().toMoney() ?? ''}',
                            style: TextStyle(color: 1.skColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.w,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '订单编号:',
                            style: TextStyle(color: 3.skColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400),
                          ),


                          Row(
                            children: [
                              Text(
                                logic.orderBean?.orderNo ?? '',
                                style: TextStyle(color: 1.skColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                              ),

                              InkWell(
                                onTap: (){
                                  CopyUtil.copyText(logic.orderBean?.orderNo ?? '');
                                  ToastUtil.showToast('复制成功');
                                },
                                child: ImageX.asset('icon_copy.png'.skImagePath,width: 12.w,height: 12.w,).padding(left: 4.w),
                              )
                            ],
                          )
                        ],
                      ),

                      SizedBox(height: 10.w,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '创建时间:',
                            style: TextStyle(color: 3.skColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400),
                          ),


                          Text(
                            logic.orderBean?.createTime ?? '',
                            style: TextStyle(color: 1.skColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ).clipRRect(all: 16.w),

                SizedBox(height: 16.w,),
                Text(
                  '说明：',
                  style: TextStyle(color: 1.skColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 6.w,),


                Text(orderDirections,
                  style: TextStyle(color: 3.skColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400),)


              ],
            ),
          ),
        ),
      );
    });




  }

  //等待付款
  buildWaitingPay(){


    if(logic.orderBean == null){
      return Container();
    }

    String state = logic.orderBean?.state ?? '1';


    switch(state){
      case '1':
        return buildPay();
      case '2':
        return buildPaid();
      case '3':
        return buildCancel();
      default:
        return Container();
    }

  }

  //已取消
  buildCancel(){
    return Container(
      height: 102.w,
      color: 2.skColor,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.w),
      alignment: Alignment.topCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container(
          //   child: buildPrice(),
          // ),

          InkWell(
            onTap: (){
              Get.until((route) => route.settings.name == AppRoutes.mainTabPage);
            },
            child: Container(

              color: 2.skColor,
              height: 44.w,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text('我的资产',style: TextStyle(color: 1.skColor,fontSize: 16.sp,fontWeight: FontWeight.w500),).center(),

            ).clipRRect(all: 22.w).paddingAll(0.8.w).border(all: 0.7.w,radius: 22.w,color: 3.skColor),
          ),


          InkWell(
            onTap: (){
              GlobalService.to.eventBus.fire(MainTabEvent(2));
              Get.until((route) => route.settings.name == AppRoutes.mainTabPage);

            },
            child: Container(

              color: 0.skColor,
              width: 220.w,
              height: 44.w,
              child: Text('继续购买',style: TextStyle(color: 2.skColor,fontSize: 16.sp,fontWeight: FontWeight.w500),).center(),

            ).clipRRect(all: 22.w),
          ),

        ],
      ),
    ).clipRRect(topRight: 16.w, topLeft: 16.w);
  }

  //已付款
  buildPaid(){
    return Container(
      height: 102.w,
      color: 2.skColor,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.w),
      alignment: Alignment.topCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container(
          //   child: buildPrice(),
          // ),

          InkWell(
            onTap: (){
              Get.until((route) => route.settings.name == AppRoutes.mainTabPage);
            },
            child: Container(

              color: 2.skColor,
              height: 44.w,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text('我的资产',style: TextStyle(color: 1.skColor,fontSize: 16.sp,fontWeight: FontWeight.w500),).center(),

            ).clipRRect(all: 22.w).paddingAll(0.8.w).border(all: 0.7.w,radius: 22.w,color: 3.skColor),
          ),


          InkWell(
            onTap: (){
              GlobalService.to.eventBus.fire(MainTabEvent(2));
              Get.until((route) => route.settings.name == AppRoutes.mainTabPage);
            },
            child: Container(

              color: 0.skColor,
              width: 220.w,
              height: 44.w,
              child: Text('继续购买',style: TextStyle(color: 2.skColor,fontSize: 16.sp,fontWeight: FontWeight.w500),).center(),

            ).clipRRect(all: 22.w),
          ),

        ],
      ),
    ).clipRRect(topRight: 16.w, topLeft: 16.w);
  }

  //待付款
  buildPay(){
    return Container(
      height: 102.w,
      color: 2.skColor,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.w),
      alignment: Alignment.topCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container(
          //   child: buildPrice(),
          // ),

          InkWell(
            onTap: (){
              logic.cancelOrder();
            },
            child: Container(

              color: 2.skColor,
              height: 44.w,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text('取消订单',style: TextStyle(color: 1.skColor,fontSize: 16.sp,fontWeight: FontWeight.w500),).center(),

            ).clipRRect(all: 22.w).paddingAll(0.8.w).border(all: 0.7.w,radius: 22.w,color: 3.skColor),
          ),


          InkWell(
            onTap: (){
              logic.getPayMethods();
            },
            child: Container(

              color: 0.skColor,
              width: 220.w,
              height: 44.w,
              child: Text('去支付',style: TextStyle(color: 2.skColor,fontSize: 16.sp,fontWeight: FontWeight.w500),).center(),

            ).clipRRect(all: 22.w),
          ),

        ],
      ),
    ).clipRRect(topRight: 16.w, topLeft: 16.w);
  }

}
