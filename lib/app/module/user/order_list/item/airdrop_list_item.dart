import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nft_flutter/app/routes/app_routes.dart';
import 'package:nft_flutter/app/widgets/empty_view.dart';
import '../../../../../common/index.dart';
import '../../../../../common/utils/toast_util.dart';
import '../../../../../common/widgets/image_x.dart';
import '../bean/Airdrop_order_list_bean.dart';
import '../bean/order_list_bean.dart';
import '../logic.dart';

class AirdropListItemView extends StatelessWidget {
  const AirdropListItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderListLogic>(
        id: 'AirdropList',
        builder: (logic) {
          if(logic.airdropList.isEmpty){
            return const EmptyView();
          }
          return ListView.builder(
              padding: EdgeInsets.only(top: 0.w),
              itemCount: logic.airdropList.length,
              itemBuilder: (context, index) {
                AirdropOrderListItemBean bean =  logic.airdropList[index];
                return buildItem(bean);
              });
        });
  }

  String getState(bool state){
    if (state == true) {
      return '转入成功';
    }
    return '转入中';
  }

  Color getStateColor(bool state){
    if (state == true) {
      return 21.skColor;
    }
    return Colors.black;
  }

  buildItem(AirdropOrderListItemBean item) {
    return Container(
      color: 1.skColor,
      child: Container(
        height: 161.w,
        color: Colors.white,
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Container(
                  margin: EdgeInsets.only(left: 12.w,top: 16.w),
                  child: Text('订单编号:${item.orderNo}', style: TextStyle(color: 3.skColor),), ),
                Container(
                  margin: EdgeInsets.only(left: 10.w,top: 15.w),
                  child:  GestureDetector(onTap: () {
                    Clipboard.setData(ClipboardData(text: '${item.orderNo}'));
                    ToastUtil.showToast('复制成功');
                  }, child: ImageX(
                    type: ImageType.asset,
                    image: 'copy_icon.png'.imagePath,
                    height: 12.w,
                    width: 12.w,)),)
              ],),
              Container(
                margin: EdgeInsets.only(right: 12,top: 16),
                child: Text(getState(item.isOnChain ?? false), style: TextStyle(color: getStateColor(item.isOnChain ?? false)),),)
            ],),
          Container(
            margin: const EdgeInsets.only(
                left: 20, top: 16, right: 20),
            height: 1.w,
            color: 10.skColor,
          ),
          Row(children: [
            Container(
              margin: EdgeInsets.only(left: 12.w,top: 16.w),
              // color: img_bg_color,
              height: 80.w,
              width: 80.w,
              child: ImageX.url(
                '${item.collectionCover}',
                width: double.infinity,
                fit: BoxFit.cover,
                radius: 10,
              ),
              // decoration: ShapeDecoration(
              //   image: DecorationImage(
              //     image: NetworkImage('${item.collectionCover}'),
              //     // image: NetworkImage('https://fastly.picsum.photos/id/987/200/200.jpg?hmac=9X6IIE8qZgx6bJb7rf3dZELTmfyt3rZAHw65r8_ko_4'),
              //     fit: BoxFit.cover,
              //   ),
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(10),
              //   ),
              // ),
            ),
            Expanded(
              child: Container(
                // color: Colors.amber,
                height: 100.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 18.w, left: 12.w),
                              child: Text(
                                '${item.collectionName}',
                                style: TextStyle(fontSize: 14.sp,color: 1.skColor),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),),
                            // Container(
                            //   padding: EdgeInsets.only(top: 18.w, right: 12.w),
                            //   child: Text(
                            //     '¥${item.amount}',
                            //     style: TextStyle(fontSize: 18.sp,color: Colors.black),
                            //     maxLines: 1,
                            //     overflow: TextOverflow.ellipsis,
                            //   ),)

                          ],),
                        Container(
                          padding: EdgeInsets.only(top: 12.w, left: 12.w),
                          child: Text(
                            '${item.orderDate}',
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: 3.skColor),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],)
        ],),
      ),
    ).clipRRect(all: 12.w).margin(top: 15.w, left: 15.w, right: 15.w).onTap((){
      // Get.toNamed(AppRoutes.orderDetail,
      //     arguments: {'id': item.id});
    });
  }
}
